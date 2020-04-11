
import 'package:flutter/cupertino.dart';

class TestFlowDelegate extends FlowDelegate{

  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x=margin.left;
    var y=margin.right;
    for (int i=0;i<context.childCount;i++){
      var w=context.getChildSize(i).width+x+margin.right;
      if(w<context.size.width){
        context.paintChild(i,transform: new Matrix4.translationValues(x, y, 0.0));
        x=w+margin.left;
      }else{
        x=margin.left;
        y+=context.getChildSize(i).height+margin.top+margin.bottom;
        context.paintChild(i,transform: new Matrix4.translationValues(x, y, 0.0));
        x+=context.getChildSize(i).width+margin.left+margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    return Size(double.infinity,200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate!=this;
  }

}