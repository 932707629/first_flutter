import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget{

  NewRoute({Key key,@required this.text,}):super(key:key);

  final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("New Route"),
      ),
    body: Center(
      child:Column(
        children: <Widget>[
          Text(text),
        RaisedButton(
        onPressed: ()=>Navigator.pop(context,"我是返回值"),
          child: Text("返回"),
    )
        ],
      )
    ),);
  }

}