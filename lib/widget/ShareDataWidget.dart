import 'package:flutter/cupertino.dart';

class ShareDataWidget extends InheritedWidget{

  ShareDataWidget(this.data,Widget child):super(child:child);

  final int data;

  static ShareDataWidget of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // 如果返回true 则子树中依赖(build函数中有调用)本widget的子widget的state.didChangeDependencies 会被调用
    return oldWidget.data!=data;
  }

}