import 'dart:io';
import 'package:allarepodcasts/filename_cleaning.dart';
import 'package:allarepodcasts/omdb_service.dart';
import 'package:flutter/material.dart';
import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Renamer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'File Renamer'),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  List movieFiles = [];
  List movieFilesEdited = [];
  String currentDirectory = '';
  OmdbService omdbService = OmdbService();
  Map<String, dynamic>? movieData;
  void fetchMovieData(String title) async {
    final data = await omdbService.fetchMovie(title);
    setState(() {
      movieData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  color: Colors.deepPurple,
                  child: Text(
                    currentDirectory,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      foreground: Paint()..color = Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: movieFiles.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      title: Text(movieFiles[index]),
                    ),
                    Wrap(
                      spacing: MediaQuery.of(context).size.width * 0.0125,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 50,
                          child: TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Search String on OMDB',
                            ),
                            controller: TextEditingController.fromValue(
                              TextEditingValue(
                                text: FilenameCleaning().washString(
                                    movieFilesEdited[index],
                                    FilenameCleaning().cleaningPatterns),
                                selection: TextSelection.collapsed(
                                  offset: movieFilesEdited[index].length,
                                ),
                              ),
                            ),
                            onChanged: (value) =>
                                movieFilesEdited[index] = value,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            fetchMovieData(movieFilesEdited[index]);
                          },
                          style: ButtonStyle(
                            iconColor: WidgetStateProperty.all(Colors.green),
                          ),
                          child: const Icon(Icons.arrow_forward),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // writeCounter(44);

          final file = DirectoryPicker()..title = 'Select a directory';

          final result = file.getDirectory();
          if (result != null) {
            var dir = Directory(result.path);
            var files = dir.listSync();

            if (files.isNotEmpty) {
              movieFiles.clear();
            }

            for (var file in files) {
              //TODO: Make a global list of file endings for both this and the
              if (file.path.endsWith('.mp4') ||
                  file.path.endsWith('.mkv') ||
                  file.path.endsWith('.webm') ||
                  file.path.endsWith('.avi')) {
                setState(() {
                  currentDirectory = result.path;
                  movieFiles.add(file.path.split('\\').last);
                  movieFilesEdited.add(file.path.split('\\').last);
                });
              }
            }
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.folder),
      ),
    );
  }
}
