// Experimented with this code on dartpad.dev first

void main() {
  List<String> filenames = [
    'Bill.Burr.Why.Do.I.Do.This.2008.DVDRip.XviD-KYR',
    'Ronny.Chieng.Asian.Comedian.Destroys.America.2019.720p.WEB.h264-NOMA',
    'Taylor.Tomlinson.Have.It.All.2024.1080p.NF.WEB-DL.DDP5.1.H.264-DontStanUpComedee',
    'Taylor.Tomlinson.Look.at.You.2022.1080p.WEB.h264-KOGi',
    'Taylor.Tomlinson.Quarter-Life.Crisis.2020.720p.WEB.h264-NOMA',
    '"I\'m Nervous, Insecure and Squishy" - Mark Normand - Full Special [E3KN_Mhq3UQ].webm',
    'Ali Siddiq: THE DOMINO EFFECT part 2 LOSS   [FULL Comedy Standup Special] [nvofZaBh7wA].webm',
    'Ari Shaffir - JEW (2022) FULL SPECIAL [y2YtIBYM4w0].webm',
    'Bill.Burr.Im.Sorry.You.Feel.That.Way.WEBRip.1080p.mkv',
    'Bill.Burr.Live.at.Red.Rocks.2022.1080p.NF.WEB-DL.DDP5.1.x264-SMURF.mkv',
    'Bill.Burr.Paper.Tiger.2019.WEBRip.1080p.mkv',
    'Bill.Burr.Walk.Your.Way.Out.2017.WEBRip.1080p.mkv',
    'bill.burr.why.do.i.do.this.2008.dvdrip.xvid-kyr.avi',
    'Bill.Burr.You.People.Are.All.the.Same.2012.WEBRip.1080p.mkv',
    'Brian Posehn | Posehna Non Grata (Full Comedy Special) [YACippNlVGA].webm',
    'Dry Bar Double Feature - Shayne Smith [7tWavWJ8NBQ].webm',
    'Dry Bar Double Feature. Bengt Washburn [OMnPAn4L5Hs].webm',
    'FULL SPECIAL | Stavros Halkias - Live At The Lodge Room [eNpkhX85yf0].webm',
    'Greg Warren | The Salesman (Full Comedy Special) [ZtlUKRxYnVw].webm',
    'Joe List: Enough For Everybody - FULL SPECIAL [fkE8_bHaXiU].webm',
    'Joe List: I Hate Myself - Full Special [odtAJ2kPdqc].webm',
    'Joe List: This Year\'s Material - Full Special [0MOGB0nBHpg].webm',
    'Kelsey Cook | The Hustler (Full Comedy Special) [zG10W6HYKTk].webm',
    'Kyle Kinane | Shocks & Struts (Full Comedy Special) [iWR4AMqfTNA].webm',
    'Kyle Kinane | Trampoline In A Ditch (Full Comedy Special) [OIBg8L2yxJA].webm',
    'Kyle Kinane: "I Liked His Old Stuff Better" - Full Special [-8m3MFGE7hI].webm',
    'Kyle Kinane: Loose in Chicago - Full Special [UILL3Qcxos8].webm',
    'Louis Katz | "The Best Comedian You\'ve Never Heard Of" (Full Special) [01FUQkgPs3E].webm',
    'Mark Normand: Don\'t Be Yourself - Full Special [LHSTW5uPXBY].webm',
    'Mark Normand: Out To Lunch - Full Special [tDolNU89SXI].webm',
    'Patrice O\'Neal Elephant In The Room Standup Comedy 2011 SD7WeB3TJZo [HgrQkdJHdVE].webm',
    'Ronny.Chieng.Speakeasy.2022.1080p.NF.WEB-DL.DDP5.1.x264-GeTrEKT.mkv',
    'Sam Morril: I Got This - Full Special [4Xo3Fq7GGWk].webm',
    'The Domino Effect [One Hour Stand Up Comedy Special] by Ali Siddiq [EsKDNZQhVX0].webm',
    'Why Cat\'s Are Better Than Dogs. Zoltan Kaszas - Full Special [VFB4ZQT-Te8].webm',
    'Zoltan Kaszas | Modern Male (Full Comedy Special) [QN6-lDaBxm0].webm',
    'Zoltan Kaszas: White Lies - Full Special [S3uoDd3RfTQ].webm',
    'Jim.Gaffigan.Dark.Pale.2023.720p.WEB.h264EDITH.mkv',
    'john.mulaney.new.in.town.2012-yestv.avi',
    'Louis C.K. - Shameless.avi',
  ];

  // List of regex patterns and their replacements for cleaning
  List<Map<RegExp, String>> cleaningPatterns = [
    {RegExp(r'\.'): ' '}, // Replace literal . with space
    {
      RegExp(r'(mkv|avi|webm)$'): ''
    }, // Remove file extension (e.g., ".mkv", ".avi")
    {
      RegExp(r'(?i:dvdrip)|(?i:xvid)|(?i:720p)|(?i:1080p)|(?i:web)|(?i:h264|h 264)'):
          ''
    }, // Remove format (e.g., "h264", "720p")

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

  for (String filename in filenames) {
    //print('Original Filename: $filename');
    String cleanedFilename = washString(filename, cleaningPatterns);
    // Map<String, String?> info = extractInfo(cleanedFilename);
    print('Cleaned Filename: $cleanedFilename');
    // print('Extracted Info: $info\n');
  }
}

String washString(String input, List<Map<RegExp, String>> cleaningPatterns) {
  for (var pattern in cleaningPatterns) {
    pattern.forEach((regex, replacement) {
      input = input.replaceAll(regex, replacement);
    });
  }
  return input.trim();
}

Map<String, String?> extractInfo(String filename) {
  List<RegExp> patterns = [
    RegExp(r'(?:19[0-9]|20[012])[0-9]'), // Get year
    RegExp(
        r'(?<name>[a-zA-Z\s.]+)\.(?<title>[a-zA-Z\s.]+)\.(?<year>\d{4})'), // With year
    RegExp(
        r'(?<name>[a-zA-Z\s.]+)\s*[-\.]\s*(?<title>[a-zA-Z\s.]+)') // Without year
  ];

  for (var pattern in patterns) {
    final match = pattern.firstMatch(filename);
    if (match != null) {
      final name = match.namedGroup('name')?.replaceAll('.', ' ').trim();
      final title = match.namedGroup('title')?.replaceAll('.', ' ').trim();
      final year = match.namedGroup('year');
      return {
        'name': name,
        'title': title,
        'year': year,
      };
    }
  }
  return {
    'name': null,
    'title': null,
    'year': null,
  };
}
