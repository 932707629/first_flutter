
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndicatorWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("进度指示器"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 3,
            child:LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ),
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
//              value: .5,
            ),
          ),
        ],
      ),
    );
  }

}