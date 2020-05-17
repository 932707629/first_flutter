
import 'package:flutterapp/delegate/TestFlowDelegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapFlowWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("流式布局"),
      ),
      body: Column(
        children: <Widget>[
          Wrap(
            spacing: 8.0,//主轴方向的间距
            runSpacing: 4.0,//纵轴方向的间距
            alignment: WrapAlignment.center,//沿主轴方向居中
            children: <Widget>[
              new Chip(
                label: new Text("Hamilton"),
                avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text("A"),),),
              new Chip(
                label: new Text("Lafayette"),
                avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text("M"),),),
              new Chip(
                label: new Text("Mulligan"),
                avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text("H"),),),
              new Chip(
                label: new Text("Laurens"),
                avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text("J"),),),
              new Chip(
                label: new Text("Sousin"),
                avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text("S"),),),
              new Chip(
                label: new Text("Mating"),
                avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text("T"),),),
            ],

          ),
          Flow(
            delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
            children: <Widget>[
              new Container(width: 80.0,height: 80.0,color: Colors.red,),
              new Container(width: 80.0,height: 80.0,color: Colors.green,),
              new Container(width: 80.0,height: 80.0,color: Colors.blue,),
              new Container(width: 80.0,height: 80.0,color: Colors.yellow,),
              new Container(width: 80.0,height: 80.0,color: Colors.brown,),
              new Container(width: 80.0,height: 80.0,color: Colors.purple,),

            ],
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: <Widget>[
                  Container(//这算是背景
                    child: Text(
                      "Hello world",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.red,
                  ),
                  Positioned(
                    left: 18.0,
                    top: 18.0,
                    child: Text("I am Jack",),
                  ),
                  Positioned(
                    top: 18.0,
                    child: Text("Your friend"),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              widthFactor: 2,
              heightFactor: 2,
              alignment: Alignment.topRight,
              child: FlutterLogo(
                size: 60,
              ),
            ),
           /* child: Container(
              height: 120.0,
              width: 120.0,
              color: Colors.blue[50],
              child: Align(
                alignment: Alignment.topRight,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),*/
          ),
        ],
      ),
    );
  }

}