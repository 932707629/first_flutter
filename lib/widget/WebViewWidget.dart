import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WebViewState();
  }

}

class WebViewState extends State<WebViewWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Webview使用"),
      ),
      body: new WebView(
        initialUrl: "https://flutterchina.club/",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}