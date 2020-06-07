import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 原始指针事件处理
class PointerEventWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
     return PointerEventState();
  }

}

class PointerEventState extends State<PointerEventWidget>{
  PointerEvent _event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("原始指针事件处理"),
      ),
      body: Listener(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          /*width: 300.0,
          height: 150.0,*/
          child: Text(_event?.toString()??"",style: TextStyle(color: Colors.white),),
        ),
        onPointerDown: (PointerDownEvent event)=> setState(() =>_event=event),
        onPointerUp: (PointerUpEvent event)=> setState(() =>_event=event),
        onPointerMove: (PointerMoveEvent event)=> setState(() =>_event=event),
      ),

    );
  }


}