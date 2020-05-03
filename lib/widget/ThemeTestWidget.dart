import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
///主题测试
class ThemeTestWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ThemeTestWidgetState();
  }

}

class ThemeTestWidgetState extends State<ThemeTestWidget> {
  Color themeColor=Colors.teal;//当前路由主题色
  @override
  Widget build(BuildContext context) {
    ThemeData themeData=Theme.of(context);
    return Theme(
      data: ThemeData(
        primaryColor: themeColor,//用于导航栏/FloatingActionButton的背景色等
        iconTheme: IconThemeData(color: themeColor),//用于Icon颜色
      ),
      child: Scaffold(
        appBar: AppBar(title: Text("主题测试"),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.favorite),
                Icon(Icons.airport_shuttle),
                Text("颜色跟随主题"),
              ],
            ),
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(
                  color: Colors.black,
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text("颜色固定黑色"),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>
          setState(()=>
              themeColor=themeColor==Colors.teal?Colors.blue:Colors.teal
          ),
          child: Icon(Icons.palette),
        ),
      ),
    );
  }
}