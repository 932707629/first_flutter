import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WillPopScopeWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WillPopScopeState();
  }

}

class WillPopScopeState extends State<WillPopScopeWidget> {

  DateTime lastPressAt;//上次点击时间

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航返回拦截"),
      ),
      body: new WillPopScope(
        onWillPop: () async{
          if(lastPressAt==null||DateTime.now().difference(lastPressAt)>Duration(seconds: 1)){
            lastPressAt=DateTime.now();
            print("点击了返回$lastPressAt");
            return false;
          }
          return true;
        },
        child: Container(
          alignment: Alignment.center,
          child: Text("1秒内连续点击两次返回键按钮后退出"),
        ),
      ),
    );
  }

}