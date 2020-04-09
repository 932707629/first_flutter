import 'dart:async';
import 'package:firstflutter/widget/FormWidget.dart';
import 'package:firstflutter/widget/ImageIconWidget.dart';
import 'package:firstflutter/widget/IndicatorWidget.dart';
import 'package:firstflutter/widget/MaterialBtnWidget.dart';
import 'package:firstflutter/widget/NewRoute.dart';
import 'package:firstflutter/widget/ParentBWidget.dart';
import 'package:firstflutter/widget/ParentCWidget.dart';
import 'package:firstflutter/widget/RandomWordsWidget.dart';
import 'package:firstflutter/RouteObservers.dart';
import 'package:firstflutter/widget/RowColumnWidget.dart';
import 'package:firstflutter/widget/SwitchCheckWidget.dart';
import 'package:firstflutter/widget/TapboxA.dart';
import 'package:firstflutter/widget/TextFieldWidget.dart';
import 'package:firstflutter/widget/TextStyleWidget.dart';
import 'package:flutter/material.dart';

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
      routes: {
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

      },
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("路由传参"),
              textColor: Colors.blue,
              onPressed: () async {
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
          ],
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
