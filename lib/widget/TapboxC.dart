
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TapboxC extends StatefulWidget{

  TapboxC({Key key,this.active:false,@required this.onChanged}) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new TapboxCState();
  }
}

class TapboxCState extends State<TapboxC>{

  bool highlight=false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new GestureDetector(
      onTapDown: handleTapDown,
      onTapUp: handleTapUp,
      onTap: handleTap,
      onTapCancel: handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(widget.active?'Active':'Inactive',
            style: new TextStyle(fontSize: 32.0,color: Colors.white),),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
          color: widget.active?Colors.lightGreen[700]:Colors.grey[600],
        ),
      ),
    );;

  }

  void handleTap(){
    widget.onChanged(!widget.active);
  }

  void handleTapDown(TapDownDetails details){
    setState(() {
      highlight=true;
    });
  }

  void handleTapUp(TapUpDetails details){
    setState(() {
      highlight=false;
    });
  }
  void handleTapCancel(){
    setState(() {
      highlight=false;
    });
  }

}
