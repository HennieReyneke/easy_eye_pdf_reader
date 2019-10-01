import 'package:flutter/material.dart';
import 'package:flutter_pdf_viewer/flutter_pdf_viewer.dart';
import './consts.dart';
import './pdf_loader_section.dart';
import './analytics_section.dart';
//import 'package:shared_preferences/shared_preferences.dart';

//bool firstPageDone = false;
//int pNum = 0;

void main() async {
  PdfViewer.enableAnalytics(Duration(milliseconds: 500));
  PdfViewer.analyticsCallback = (pdfId, pageIndex, paused) async {
    /*SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt(pdfId) == null) {
      firstPageDone = true;
    } else
      pNum = prefs.getInt(pdfId);

    if (pNum > 0 && !firstPageDone) {
      PdfLoaderSectionState.config.initialPage = pNum;
      firstPageDone = true;
    }
    prefs.setInt(pdfId, pageIndex + 1);

    print(
        "analyticsCallback: { pdfId: $pdfId, pageNum: ${pageIndex + 1}, paused: $paused }");*/
  };
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      //theme: ThemeData(
      //primarySwatch: Colors.teal,
      //accentColor: Colors.yellow,
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text(
            appTitle,
            style: TextStyle(
                fontSize: appFontSizeHuge, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: new Center(
          child: ListView(
            children: [
              PdfLoaderSection(),
              AnalyticsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
