import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchCheckWidget extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SwitchCheckState();
  }

}

class SwitchCheckState extends State<SwitchCheckWidget>{
  bool switchSelect=true;//单选开关
  bool checkSelect=true;//复选框

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("单选开关和复选框"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
              value: switchSelect,
              activeColor: Colors.red,
              onChanged: (value){
                setState(() {
                  switchSelect=value;
                });
              },
            ),
            Checkbox(
              value: checkSelect,
              activeColor: Colors.red,
              onChanged: (value){
                setState(() {
                  checkSelect=value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }


}