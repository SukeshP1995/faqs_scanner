import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:url_launcher/url_launcher.dart';


class MainPage extends StatefulWidget {
  MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // String _content = "";

  _scanQR () async {
    String _url = (await BarcodeScanner.scan()).rawContent;
    String locale = Platform.localeName;
    await launch('$_url?linkType=gs1:faqs', headers: { "accept-language": locale});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Scan the QR for FAQs',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scanQR,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
