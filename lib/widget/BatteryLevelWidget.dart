import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///获取手机电池电量
class BatteryLevelWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BatteryLevelState();
  }

}

class BatteryLevelState extends State<BatteryLevelWidget> {

  static const platform = const MethodChannel('me.soushin.flutterapp/battery');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("获取电池电量"),
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton(
              onPressed: getBatteryLevel,
              child: new Text('GET Battery Level'),
            ),
            new Text(_batteryLevel),
          ],
        ),
      ),
    );
  }

  ///获取电池状态
  String _batteryLevel='Unknown battery level.';

  Future<Null> getBatteryLevel() async {
    String batteryLevel;
    try{

      print('输出当前平台信息 ${defaultTargetPlatform}');

      final int result= await platform.invokeMethod('getBatteryLevel');
      batteryLevel='Battery level at $result % .';
    } on PlatformException catch (e){
      batteryLevel="Failed to get battery level: '${e.message}'.";
    }
    setState(() {
      _batteryLevel=batteryLevel;
    });
  }


}