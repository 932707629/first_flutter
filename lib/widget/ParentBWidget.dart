import 'package:firstflutter/widget/TapboxB.dart';
import 'package:flutter/cupertino.dart';

class ParentBWidget extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ParentWidgetState();
  }

}

class ParentWidgetState  extends State<ParentBWidget>{
  bool active=false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new TapboxB(active: this.active,onChanged: handleTapboxChanged,),
    );
  }

  void handleTapboxChanged(bool newValue){
    setState(() {
      active=newValue;
    });
  }


}