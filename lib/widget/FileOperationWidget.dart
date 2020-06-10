import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileOperationWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return FileOperationState();
  }

}

class FileOperationState extends State<FileOperationWidget> {
  int counter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文件操作"),
      ),
      body: Center(
        child: new Text('点击了$counter次'),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }


  /// getTemporaryDirectory()  临时目录(应用缓存文件)
  /// getApplicationDocumentsDirectory();  文档目录(AppData里的文件 卸载后即清除该目录)
  /// getExternalStorageDirectory();   外部存储目录  iOS上不支持外部存储文件 调用这个方法会报错
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    readCounter().then((int value){
      setState(() {
        counter=value;
      });
    });

  }

  Future<int> readCounter() async {
    try{
      File file=await getLocalFile();
      String contents=await file.readAsString();
      return int.parse(contents);
    }on FileSystemException{
      return 0;
    }
  }

  Future<File> getLocalFile() async {
    String dir=(await getApplicationDocumentsDirectory()).path;
    return new File('$dir/counter.txt');
  }

  Future<Null> incrementCounter() async{
    setState(() {
      counter++;
    });
    await (await getLocalFile()).writeAsString('$counter');
  }



}
