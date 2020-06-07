import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///手势识别
class GestureDetectorWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return GestureDetectorState();
  }
}

class GestureDetectorState extends State<GestureDetectorWidget> with SingleTickerProviderStateMixin{
  String operation="No Gesture detected!";
  double top=0.0;
  double left=0.0;
  double top_v=0.0;
  double _width=200.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势识别"),
      ),
      body: Stack(
        children: <Widget>[
          GestureDetector(//点击双击长按
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
//              width: 200.0,
//              height: 100.0,
              child: Text(
                operation,style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: ()=>updateText("Tap"),
            onDoubleTap:  ()=>updateText("DoubleTap"),
            onLongPress:  ()=>updateText("LongPress"),
          ),
          Positioned(//拖动
            top: top,
            left: left,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("A"),
              ),
              onPanDown: (DragDownDetails e){
                print("用户手指按下:${e.globalPosition}");
              },
              onPanUpdate: (DragUpdateDetails e){
                setState(() {
                  left+=e.delta.dx;
                  top+=e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e){
                print(e.velocity);
              },
            ),
          ),
          Positioned(//单一方向拖动
            top: top_v,
            child: GestureDetector(
              child: CircleAvatar(child: Text("A"),),
              onVerticalDragUpdate: (DragUpdateDetails details){
                setState(() {
                  top_v+=details.delta.dy;
                });
              },
            ),
          ),
          GestureDetector(
            child: Icon(Icons.fingerprint,color: Colors.green,size: 50,),
            onScaleUpdate: (ScaleUpdateDetails details){
              setState(() {
                _width=200*details.scale.clamp(.8, 10.0);
              });
            },
          ),
        ],
      ),
    );
  }

  updateText(String s) {
    setState(() {
      operation=s;
    });
  }
}














