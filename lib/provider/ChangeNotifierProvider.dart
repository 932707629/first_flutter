
import 'package:flutterapp/provider/ChangeNotifierProviderState.dart';
import 'package:flutterapp/provider/InheritedWidget.dart';
import 'package:flutter/cupertino.dart';

Type typeof<T>()=>T;

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget{

  ChangeNotifierProvider({Key key,this.data,this.child,});

  final Widget child;
  final T data;

  static T of<T> (BuildContext context,{bool listen=true}){
//    final type=typeof<InheritedProvider<T>>();
//    final provider =context.inheritFromWidgetOfExactType(type) as InheritedProvider<T>;
  final provider=listen?context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
      :context.getElementForInheritedWidgetOfExactType<InheritedProvider<T>>().widget as InheritedProvider<T>;
    return provider.data;
  }

  @override
  ChangeNotifierProviderState<T> createState() {
    return ChangeNotifierProviderState<T>();
  }

}