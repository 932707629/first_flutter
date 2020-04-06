import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ALog.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController= TextEditingController();
  FocusNode focusNode1=new FocusNode();
  FocusNode focusNode2=new FocusNode();
  FocusScopeNode focusScopeNode;


  @override
  Widget build(BuildContext context) {
    textEditingController.addListener(() {
      print("input${textEditingController.text}");
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("输入框和表单"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                autofocus: true,
                focusNode: focusNode1,
                onChanged: (value) {
                  ALog.e(["输入值改变$value"]);
                },
                controller: textEditingController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  enabledBorder: UnderlineInputBorder(//未获得焦点 下划线灰色
                    borderSide: BorderSide(color: Colors.grey)
                  ),
                  focusedBorder: UnderlineInputBorder(//获得焦点 下划线蓝色
                    borderSide: BorderSide(color: Colors.blue)
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock),
                ),
                onChanged: (v) {
                  print(v);
                },
                focusNode: focusNode2,
                obscureText: true,
              ),
            ),
            RaisedButton(
              child: Text("移动焦点"),
              onPressed: (){
                if(null==focusScopeNode){
                  focusScopeNode=FocusScope.of(context);
                }
                focusScopeNode.requestFocus(focusNode2);
              },
            ),
            RaisedButton(
              child: Text("隐藏键盘"),
              onPressed: (){
                focusNode1.unfocus();
                focusNode2.unfocus();
              },
            )
          ],
        ),
      ),
    );
  }
}
