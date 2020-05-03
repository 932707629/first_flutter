import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
///异步数据更新UI
class FutureBuilderWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilderWidget异步数据更新UI"),
      ),
      body: Center(
        child: FutureBuilder(
          future: mockNetworkData(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.connectionState==ConnectionState.done){
              if(snapshot.hasError){//请求失败,显示数据
                return Text("Error:${snapshot.error}");
              }else{//请求成功,显示数据
                return Text("Content:${snapshot.data}");
              }
            }else{//请求未结束,显示loading
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

//这里是从网络获取数据的操作
Future<String> mockNetworkData() async {
  return Future.delayed(Duration(seconds: 2),()=>"我是从互联网上获取的数据呀");
}