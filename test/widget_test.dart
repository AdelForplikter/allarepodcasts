// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:allarepodcasts/filename_cleaning.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:allarepodcasts/main.dart';

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

List<String> filenamesExpected = [
  'Bill Burr Why Do I Do This 2008',
  'Ronny Chieng Asian Comedian Destroys America 2019',
  'Taylor Tomlinson Have It All 2024',
  'Taylor Tomlinson Look at You 2022',
  'Taylor Tomlinson QuarterLife Crisis 2020',
  'Im Nervous, Insecure and Squishy Mark Normand',
  'Ali Siddiq THE DOMINO EFFECT LOSS',
  'Ari Shaffir JEW 2022',
  'Bill Burr Im Sorry You Feel That Way',
  'Bill Burr Live at Red Rocks 2022 x264SMURF',
  'Bill Burr Paper Tiger 2019',
  'Bill Burr Walk Your Way Out 2017',
  'bill burr why do i do this 2008 kyr',
  'Bill Burr You People Are All the Same 2012',
  'Brian Posehn Posehna Non Grata',
  'Dry Bar Double Feature Shayne Smith',
  'Dry Bar Double Feature Bengt Washburn',
  'Stavros Halkias Live At The Lodge Room',
  'Greg Warren The Salesman',
  'Joe List Enough For Everybody',
  'Joe List I Hate Myself',
  'Joe List This Years Material',
  'Kelsey Cook The Hustler',
  'Kyle Kinane Shocks & Struts',
  'Kyle Kinane Trampoline In A Ditch',
  'Kyle Kinane I Liked His Old Stuff Better',
  'Kyle Kinane Loose in Chicago',
  'Louis Katz The Best Comedian Youve Never Heard Of',
  'Mark Normand Dont Be Yourself',
  'Mark Normand Out To Lunch',
  'Patrice ONeal Elephant In The Room 2011 SD73TJZo',
  'Ronny Chieng Speakeasy 2022 x264GeTrEKT',
  'Sam Morril I Got This',
  'The Domino Effect Comedy Special by Ali Siddiq',
  'Why Cats Are Better Than Dogs Zoltan Kaszas',
  'Zoltan Kaszas Modern Male',
  'Zoltan Kaszas White Lies',
  'Jim Gaffigan Dark Pale 2023 EDITH',
  'john mulaney new in town 2012yestv',
  'Louis C K Shameless'
];

void main() {
  testWidgets('smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
  });
  testWidgets('cleaning test', (WidgetTester tester) async {
    int countFilename = 0;
    for (String filename in filenames) {
      //print('Original Filename: $filename');
      String cleanedFilename = FilenameCleaning()
          .washString(filename, FilenameCleaning().cleaningPatterns);
      // Map<String, String?> info = extractInfo(cleanedFilename);
      expect(cleanedFilename, filenamesExpected[countFilename]);
      countFilename++;
      // print('Cleaned Filename: $cleanedFilename');
      // print('Extracted Info: $info\n');
    }
  });
}
