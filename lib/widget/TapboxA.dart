
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TapboxA extends StatefulWidget{

  TapboxA({Key key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new TapboxAState();
  }

}

class TapboxAState extends State<TapboxA> {
  bool active=false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(onTap: handleTap,child: new Container(
      child: new Text(
        active?'Active':'Inactive',
        style: new TextStyle(fontSize: 32.0,color: Colors.white),
      ),
      width: 200,
      height: 200,
      decoration: new BoxDecoration(color: active?Colors.lightGreen[700]:Colors.grey[600]),
    ),);
  }

  void handleTap(){
    setState(() {
      active=!active;
    });
  }


}