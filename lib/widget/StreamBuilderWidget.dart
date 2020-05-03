import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
///
class StreamBuilderWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StreamBuilderWidget异步数据更新UI"),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: counter(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.hasError){
              return Text('Error:${snapshot.error}');
            }
            switch(snapshot.connectionState){
              case ConnectionState.none:
                return Text("没有stream");
              case ConnectionState.waiting:
                return Text("等待数据...");
              case ConnectionState.active:
                return Text("active:${snapshot.data}");
              case ConnectionState.done:
                return Text("Stream关闭");
            }
            return null;
          },
        ),
      ),
    );
  }

}


Stream<int> counter(){
  return Stream.periodic(Duration(seconds: 1),(i){
    return i;
  },);
}