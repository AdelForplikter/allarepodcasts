class FilenameCleaning {
  // List of regex patterns and their replacements for cleaning
  List<Map<RegExp, String>> cleaningPatterns = [
    {RegExp(r'\.'): ' '}, // Replace literal . with space
    {
      RegExp(r'(mkv|avi|webm)$'): ''
    }, // Remove file extension (e.g., ".mkv", ".avi")
    {RegExp(r'?i:dvdrip'): ''},
    {RegExp(r'(?i:xvid)'): ''},
    {RegExp(r'(?i:720p)'): ''},
    {RegExp(r'(?i:1080p)'): ''},
    {RegExp(r'(?i:web)'): ''},
    {RegExp(r'(?i:h264)'): ''},

    // Remove format (e.g., "h264", "720p")

    {RegExp(r'-\w+$'): ''}, // Remove trailing group name (e.g., "-EDITH")
    {RegExp(r'(?i:Full Special)'): ''}, // Remove sentence. Case insensitive
    {
      RegExp(r'(?i:Full Comedy Special)'): ''
    }, // Remove sentence Case insensitive
    {
      RegExp(r'(?i:Full Comedy Standup Special)'): ''
    }, // Remove sentence Case insensitive
    {RegExp(r'\[[a-zA-Z0-9-_]{11}\]'): ''}, // Replace youtube-links
    {RegExp(r'(?i: NF )'): ''},
    {RegExp(r"[/']"): ''}, // Replace single quotes
    {RegExp(r'[/"]'): ''}, // Replace double quotesr
    {RegExp(r'[:]'): ''}, // Replace :
    {RegExp(r'[(]'): ''}, // Replace (
    {RegExp(r'[)]'): ''}, // Replace )
    {RegExp(r'[|]'): ''}, // Replace |
    {RegExp(r'[/[]'): ''}, // Replace [
    {RegExp(r']'): ''}, // Replace ]
    {RegExp(r'[-]'): ''}, // Replace -
    {RegExp(r'\s+'): ' '}, // Replace multiple spaces with a single space
  ];

  String washString(String input, List<Map<RegExp, String>> cleaningPatterns) {
    for (var pattern in cleaningPatterns) {
      pattern.forEach((regex, replacement) {
        input = input.replaceAll(regex, replacement);
      });
    }
    return input.trim();
  }
}

  // for (String filename in filenames) {
  //   //print('Original Filename: $filename');
  //   String cleanedFilename = washString(filename, cleaningPatterns);
  //   // Map<String, String?> info = extractInfo(cleanedFilename);
  //   print('Cleaned Filename: $cleanedFilename');
  //   // print('Extracted Info: $info\n');
  // }



// Map<String, String?> extractInfo(String filename) {
//   List<RegExp> patterns = [
//     RegExp(r'(?:19[0-9]|20[012])[0-9]'), // Get year
//     RegExp(
//         r'(?<name>[a-zA-Z\s.]+)\.(?<title>[a-zA-Z\s.]+)\.(?<year>\d{4})'), // With year
//     RegExp(
//         r'(?<name>[a-zA-Z\s.]+)\s*[-\.]\s*(?<title>[a-zA-Z\s.]+)') // Without year
//   ];

//   for (var pattern in patterns) {
//     final match = pattern.firstMatch(filename);
//     if (match != null) {
//       final name = match.namedGroup('name')?.replaceAll('.', ' ').trim();
//       final title = match.namedGroup('title')?.replaceAll('.', ' ').trim();
//       final year = match.namedGroup('year');
//       return {
//         'name': name,
//         'title': title,
//         'year': year,
//       };
//     }
//   }
//   return {
//     'name': null,
//     'title': null,
//     'year': null,
//   };

