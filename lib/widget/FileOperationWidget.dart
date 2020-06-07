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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文件操作"),
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

  }



}