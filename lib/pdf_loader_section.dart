import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdf_viewer/flutter_pdf_viewer.dart';
import 'package:file_picker/file_picker.dart';
import './consts.dart';

class PdfLoaderSection extends StatefulWidget {
  @override
  PdfLoaderSectionState createState() => new PdfLoaderSectionState();
}

class PdfLoaderSectionState extends State<PdfLoaderSection> {
  String _path;
  String _extension = 'pdf';
  FileType _pickingType = FileType.CUSTOM;

  static final config = PdfViewerConfig(
    nightMode: false,
    enableSwipe: true,
    swipeHorizontal: false,
    autoSpacing: false,
    pageFling: true,
    pageSnap: false,
    enableImmersive: false,
    autoPlay: false,
    forceLandscape: false,
    slideShow: false,
  );

  Future<String> _openFileExplorer() async {
    try {
      _path = await FilePicker.getFilePath(
          type: _pickingType, fileExtension: _extension);
    } on PlatformException catch (e) {
      print("Unsupported Operation: " + e.toString());
    }
    if (!mounted) return null;
    return _path;
  }

  Future<void> onPressed() async {
    await PdfViewer.loadFile(await _openFileExplorer(), config: config);
  }

  List<Widget> showConfig() {
    return <Widget>[
      Container(height: appMargin),
      Text(
        'Options',
        style: TextStyle(
          fontSize: appFontSizeBig,
          fontWeight: FontWeight.bold,
        ),
      ),
      CheckboxListTile(
        dense: true,
        title: Text(
          'Night Mode',
          style: TextStyle(
              fontSize: appFontSizeNormal, fontWeight: FontWeight.normal),
        ),
        value: config.nightMode,
        onChanged: ((val) {
          setState(() {
            config.nightMode = val;
          });
        }),
      ),
      CheckboxListTile(
        dense: true,
        title: Text(
          'Swipe Horizontal',
          style: TextStyle(
              fontSize: appFontSizeNormal, fontWeight: FontWeight.normal),
        ),
        value: config.swipeHorizontal,
        onChanged: ((val) {
          setState(() {
            config.swipeHorizontal = val;
          });
        }),
      ),
      CheckboxListTile(
        dense: true,
        title: Text(
          'Disable Page Fling',
          style: TextStyle(
              fontSize: appFontSizeNormal, fontWeight: FontWeight.normal),
        ),
        value: !config.pageFling,
        onChanged: ((val) {
          setState(() {
            config.pageFling = !val;
          });
        }),
      ),
      CheckboxListTile(
        dense: true,
        title: Text(
          'Force Landscape',
          style: TextStyle(
              fontSize: appFontSizeNormal, fontWeight: FontWeight.normal),
        ),
        value: config.forceLandscape,
        onChanged: ((val) {
          setState(() {
            config.forceLandscape = val;
          });
        }),
      ),
      Container(
        height: appMargin,
      ),
      RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(appButBorderRad)),
        color: Color(appButCol),
        padding:
            EdgeInsets.symmetric(vertical: appMargin, horizontal: appButMargin),
        child: Text(
          'Open PDF',
          style:
              TextStyle(fontSize: appFontSizeHuge, fontWeight: FontWeight.bold),
        ),
        onPressed: onPressed,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: showConfig());
  }
}
