
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new FormWidgetState();
  }




}

class FormWidgetState extends State<FormWidget> {

  GlobalKey formKey=new GlobalKey<FormWidgetState>();
  TextEditingController username=new TextEditingController();
  TextEditingController pwd=new TextEditingController();





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("表单"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 24.0),
        child: Form(
          key: formKey,
          autovalidate: true,//开启自动校验
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: username,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  icon: Icon(Icons.person),
                ),
                validator: (v){
                  return v.trim().length>0?null:"用户名不能为空";
                },
              ),
              TextFormField(
                autofocus: true,
                controller: pwd,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  icon: Icon(Icons.lock),
                ),
                validator: (v){
                  return v.trim().length>0?null:"密码不能少于6位";
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  children: <Widget>[
                   Expanded(
                     child:RaisedButton(
                       padding: EdgeInsets.all(15),
                       child: Text("登录"),
                       color: Theme.of(context).primaryColor,
                       textColor: Colors.white,
                       onPressed: (){
                         if((formKey.currentState as FormState).validate()){
                           print("验证已经通过了");
                         }
                       },
                     ),
                   ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



}