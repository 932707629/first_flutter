
import 'package:flutter/cupertino.dart';

//一个通用的InheritedWidget,保存需要跨组件共享的状态
class InheritedProvider<T> extends InheritedWidget{

  InheritedProvider({@required this.data,Widget child}) :super(child:child);
  //共享状态使用泛型
  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> oldWidget) {
    return true;
  }

}