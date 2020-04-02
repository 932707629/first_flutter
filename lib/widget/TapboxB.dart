
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TapboxB extends StatelessWidget{

  TapboxB({Key key,this.active:false,@required this.onChanged}) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: handleTap,
      child: new Container(
        child: new Center(
          child: new Text(active?'Active':'Inactive',
          style: new TextStyle(fontSize: 32.0,color: Colors.white),),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
          color: active?Colors.lightGreen[700]:Colors.grey[600],
        ),
      ),
    );
  }

  void handleTap(){
    onChanged(!active);
  }



}
