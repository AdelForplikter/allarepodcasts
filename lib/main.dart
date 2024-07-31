import 'dart:io';
import 'package:flutter/material.dart';
import 'package:filepicker_windows/filepicker_windows.dart';
import 'auth/secrets.dart';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/xm33count99.txt');
}

Future<File> writeCounter(int counter) async {
  final file = await _localFile;
  return file.writeAsString('$counter');
}

Future<int> readCounter() async {
  try {
    final file = await _localFile;

    // Read the file
    final contents = await file.readAsString();

    return int.parse(contents);
  } catch (e) {
    // If encountering an error, return 0
    return 0;
  }
}

void main() {
  runApp(const MyApp());
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
      home: MyHomePage(title: 'File Renamer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  List movieFiles = [];
  String currentDirectory = '';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List movieFiles = widget.movieFiles;
    // String currentDirectory = widget.currentDirectory;
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
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  color: Colors.deepPurple,
                  child: Text(
                    widget.currentDirectory,
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
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 50,
                          child: TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Name',
                            ),
                            controller: TextEditingController.fromValue(
                              TextEditingValue(
                                text: movieFiles[index],
                                selection: TextSelection.collapsed(
                                  offset: movieFiles[index].length,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Album',
                            ),
                            controller: TextEditingController.fromValue(
                              TextEditingValue(
                                text: '$omdbapikey',
                                selection: TextSelection.collapsed(
                                  offset: movieFiles[index].length,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Year|',
                            ),
                            controller: TextEditingController.fromValue(
                              TextEditingValue(
                                text: movieFiles[index],
                                selection: TextSelection.collapsed(
                                  offset: movieFiles[index].length,
                                ),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            readCounter().then((value) {
                              writeCounter(value + 1);
                              print(value + 1);
                              print(Platform.resolvedExecutable);
                            });
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
          writeCounter(44);

          final file = DirectoryPicker()..title = 'Select a directory';

          final result = file.getDirectory();
          if (result != null) {
            var dir = Directory(result.path);
            var files = dir.listSync();

            if (files.isNotEmpty) {
              movieFiles.clear();
            }

            for (var file in files) {
              if (file.path.endsWith('.mp4') ||
                  file.path.endsWith('.mkv') ||
                  file.path.endsWith('.avi')) {
                setState(() {
                  widget.currentDirectory = result.path;
                  movieFiles.add(file.path.split('\\').last);
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
