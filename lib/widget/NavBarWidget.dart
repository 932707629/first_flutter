import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 自定义一个导航栏
class NavBarWidget extends StatelessWidget{
  final String title;
  final Color color;//背景颜色

  NavBarWidget({Key key,this.color,this.title,});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color:Colors.black26,
            offset: Offset(0,3),
            blurRadius: 3,
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color.computeLuminance()<0.5?Colors.white:Colors.black,
        ),
      ),
      alignment: Alignment.center,
    );
  }

}