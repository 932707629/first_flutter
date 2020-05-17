import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Text文本风格"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Hello World",
              textAlign: TextAlign.left,
            ),
            Text(
              "Hello World" * 10,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
            ),
            Text(
              "Hello World",
              textScaleFactor: 1.5,
            ),
            Text(
              "Hello World",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: "Courier",
                background: new Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: "Home: "
              ),
              TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(
                  color: Colors.blue,
                ),
              )
            ]))
          ],
        ),
      ),
    );
  }
}
