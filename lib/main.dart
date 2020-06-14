import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutterapp/EventBus.dart';
import 'package:flutterapp/widget/BatteryLevelWidget.dart';
import 'package:flutterapp/widget/CustomScrollViewWidget.dart';
import 'package:flutterapp/widget/DialogWidget.dart';
import 'package:flutterapp/widget/FileOperationWidget.dart';
import 'package:flutterapp/widget/FormWidget.dart';
import 'package:flutterapp/widget/FutureBuilderWidget.dart';
import 'package:flutterapp/widget/GestureDetectorWidget.dart';
import 'package:flutterapp/widget/HttpWidget.dart';
import 'package:flutterapp/widget/ImageIconWidget.dart';
import 'package:flutterapp/widget/IndicatorWidget.dart';
import 'package:flutterapp/widget/ListViewWidget.dart';
import 'package:flutterapp/widget/MaterialBtnWidget.dart';
import 'package:flutterapp/widget/NewRoute.dart';
import 'package:flutterapp/widget/ParentBWidget.dart';
import 'package:flutterapp/widget/ParentCWidget.dart';
import 'package:flutterapp/widget/PointerEventWidget.dart';
import 'package:flutterapp/widget/ProviderWidget.dart';
import 'package:flutterapp/widget/RandomWordsWidget.dart';
import 'package:flutterapp/RouteObservers.dart';
import 'package:flutterapp/widget/RowColumnWidget.dart';
import 'package:flutterapp/widget/ScaffoldWidget.dart';
import 'package:flutterapp/widget/StreamBuilderWidget.dart';
import 'package:flutterapp/widget/SwitchCheckWidget.dart';
import 'package:flutterapp/widget/TapboxA.dart';
import 'package:flutterapp/widget/TextFieldWidget.dart';
import 'package:flutterapp/widget/TextStyleWidget.dart';
import 'package:flutterapp/widget/ThemeTestWidget.dart';
import 'package:flutterapp/widget/WebSocketWidget.dart';
import 'package:flutterapp/widget/WebViewWidget.dart';
import 'package:flutterapp/widget/WrapFlowWidget.dart';
import 'package:flutter/material.dart';

import 'widget/GridViewWidget.dart';
import 'widget/WillPopScopeWidget.dart';



void main() {
//  runApp(MyApp());
  FlutterError.onError = (FlutterErrorDetails details) {
    //上报错误和日志逻辑
  };
  runZoned(() => runApp(MyApp()), zoneSpecification: new ZoneSpecification(
//      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
//    //这里拦截所有日志输出
//    parent.print(zone, "Intercepted:$line");
//  }
  ), onError: (Object obj, StackTrace stack) {
    //这里可以构建错误信息,然后上报
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  Map<String,WidgetBuilder> routePages={
    "new_route": (context) {
      return NewRoute(text: ModalRoute.of(context).settings.arguments);
    },
    "/": (context) => MyHomePage(title: "Flutter Demo Home Page"),
    "tapboxa": (context) => TapboxA(),
    "tapboxb": (context) => ParentBWidget(),
    "tapboxc": (context) => ParentCWidget(),
    "textStyle": (context) => TextStyleWidget(),
    "materialBtn": (context) => MaterialBtnWidget(),
    "imageIcon": (context) => ImageIconWidget(),
    "switchCheck": (context) => SwitchCheckWidget(),
    "textField": (context) => TextFieldWidget(),
    "formWidget": (context) => FormWidget(),
    "indicatorWidget": (context) => IndicatorWidget(),
    "rowColumnWidget": (context) => RowColumnWidget(),
    "wrapFlowWidget": (context) => WrapFlowWidget(),
    "scaffoldWidget": (context) => ScaffoldWidget(),
    "listViewWidget": (context) => ListViewWidget(),
    "gridViewWidget": (context) => GridViewWidget(),
    "customScrollViewWidget": (context) => CustomScrollViewWidget(),
    "willPopScopeWidget": (context) => WillPopScopeWidget(),
    "providerWidget": (context) => ProviderWidget(),
    "themeTestWidget": (context) => ThemeTestWidget(),
    "futureBuilderWidget": (context) => FutureBuilderWidget(),
    "streamBuilderWidget": (context) => StreamBuilderWidget(),
    "DialogWidget": (context) => DialogWidget(),
    "PointerEventWidget": (context) => PointerEventWidget(),
    "GestureDetectorWidget": (context) => GestureDetectorWidget(),
    "FileOperationWidget": (context) => FileOperationWidget(),
    "HttpWidget": (context) => HttpWidget(),
    "WebSocketWidget": (context) => WebSocketWidget(),
    "BatteryLevelWidget": (context) => BatteryLevelWidget(),
    "WebViewWidget": (context) => WebViewWidget(),

  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: routePages,
      navigatorObservers: [RouteObservers()],

//      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

//  @override
//  SnackBarState createState() => SnackBarState();
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Scrollbar(
        child: SingleChildScrollView(
          child:  Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("路由传参"),
                  textColor: Colors.blue,
                  onPressed: () async {
                    //事件总线发送
                    bus.emit("route","我是提示信息 by EventBus");

                    var result = await Navigator.pushNamed(context, "new_route",
                        arguments: "我是提示信息");
                    /*var result=await Navigator.push(context, MaterialPageRoute(builder: (context){
                  return NewRoute(text: "我是提示信息",);
                }));*/
                    print("路由返回值:$result");
                  },
                ),
                Text(
                  'You have clicked the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
                RandomWordsWidget(),
                Wrap(
                  spacing: 4.0,
                  runSpacing: 4.0,
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("tapboxa"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "tapboxa");
                      },
                    ),
                    RaisedButton(
                      child: Text("tapboxb"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "tapboxb");
                      },
                    ),
                    RaisedButton(
                      child: Text("tapboxc"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "tapboxc");
                      },
                    ),
                    RaisedButton(
                      child: Text("testStyle"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "textStyle");
                      },
                    ),
                    RaisedButton(
                      child: Text("materialBtn"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "materialBtn");
                      },
                    ),
                    RaisedButton(
                      child: Text("imageIcon"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "imageIcon");
                      },
                    ),
                    RaisedButton(
                      child: Text("switchCheck"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "switchCheck");
                      },
                    ),
                    RaisedButton(
                      child: Text("textField"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "textField");
                      },
                    ),
                    RaisedButton(
                      child: Text("formWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "formWidget");
                      },
                    ),
                    RaisedButton(
                      child: Text("indicatorWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "indicatorWidget");
                      },
                    ),
                    RaisedButton(
                      child: Text("rowColumnWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "rowColumnWidget");
                      },
                    ),
                    RaisedButton(
                      child: Text("wrapFlowWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "wrapFlowWidget");
                      },
                    ),
                    RaisedButton(
                      child: Text("scaffoldWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "scaffoldWidget");
                      },
                    ),
                    RaisedButton(
                      child: Text("listViewWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "listViewWidget");
                      },
                    ),
                    RaisedButton(
                      child: Text("gridViewWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "gridViewWidget");
                      },
                    ),
                    RaisedButton(
                      child: Text("customScrollViewWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "customScrollViewWidget");
                      },
                    ),
                    RaisedButton(
                      child: Text("willPopScopeWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "willPopScopeWidget");
                      },
                    ),
                    RaisedButton(
                      child: Text("providerWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "providerWidget");
                      },
                    ),
                    RaisedButton(
                      child: Text("themeTestWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "themeTestWidget");
                      },
                    ),
                    RaisedButton(
                      child: Text("futureBuilderWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "futureBuilderWidget");
                      },
                    ),
                    RaisedButton(
                      child: Text("streamBuilderWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "streamBuilderWidget");
                      },
                    ),
                    RaisedButton(
                      child: Text("DialogWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "DialogWidget");
                      },
                    ),
                    RaisedButton(
                      child: Text("PointerEventWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "PointerEventWidget");
                      },
                    ),
                    RaisedButton(
                      child: Text("GestureDetectorWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "GestureDetectorWidget");
                      },
                    ),
                    RaisedButton(
                      child: Text("FileOperationWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "FileOperationWidget");
                      },
                    ),
                    RaisedButton(
                      child: Text("HttpWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "HttpWidget");
                      },
                    ),
                    RaisedButton(
                      child: Text("WebSocketWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "WebSocketWidget");
                      },
                    ),
                    RaisedButton(
                      child: Text("BatteryLevelWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "BatteryLevelWidget");
                      },
                    ),
                    RaisedButton(
                      child: Text("WebViewWidget"),
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, "WebViewWidget");
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
