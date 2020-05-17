
import 'package:flutterapp/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackBarState extends State<MyHomePage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(//断头台这个名字很犀利呀
      appBar: AppBar(
        title: Text("子树中获取state对象"),
      ),
      body: Center(
        child:Builder(builder: (context){
          return RaisedButton(
            onPressed: (){
              ScaffoldState state=Scaffold.of(context);
              state.showSnackBar(SnackBar(content: Text("我是SnackBar"),));
            },
            child: Text("显示snackBar"),
          );
        },
        ),
      ),
    );
  }


}