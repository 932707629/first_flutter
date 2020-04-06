import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ALog.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController= TextEditingController();

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
                onChanged: (value) {
                  ALog.e(["输入值改变$value"]);
                },
                controller: textEditingController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
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
                obscureText: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
