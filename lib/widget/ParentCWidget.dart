import 'package:flutterapp/widget/TapboxC.dart';
import 'package:flutter/cupertino.dart';

class ParentCWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ParentCState();
  }

}

class ParentCState extends State<ParentCWidget>{
  bool active=false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child:new TapboxC(active: this.active,onChanged: handleTapboxChanged,),
    );
  }

  void handleTapboxChanged(bool newValue){
    setState(() {
      active=newValue;
    });
  }



}