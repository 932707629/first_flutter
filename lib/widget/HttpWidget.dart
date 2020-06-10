


import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HttpWidget extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HttpState();
  }

}

class HttpState extends State<HttpWidget>{
  bool loading=false;
  String text="";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("网络操作"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("获取百度首页"),
                onPressed: loading?null:()async{
                  setState(() {
                    loading=true;
                    text="正在请求...";
                  });
                  try{
                    //创建一个httpclient
                    HttpClient httpclient=new HttpClient();
                    //打开http连接
                    HttpClientRequest request= await httpclient.getUrl(Uri.parse("https://www.baidu.com"));
                    request.headers.add("user-agent", "Mozilla/5.0(iPhone; CPU iPhone OS 10_3_1 like Mac OS X) "
                        "AppleWebKit/603.1.30(KHTML,like Geoko)Version/10.0 Mobile/14E304 Safari/602.1");
                    //等待连接服务器（会将请求信息发送给服务器）
                    HttpClientResponse response=await request.close();
                    //读取响应内容
                    text=await response.transform(utf8.decoder).join();
                    //输出响应头
                    print(response.headers);

                    //关闭client后，通过该client发起的所有请求都会终止
                    httpclient.close();
                  }catch(e){
                    text="请求失败$e";
                  }finally{
                    setState(() {
                      loading=false;
                    });
                  }
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width-50.0,
                child: Text(text.replaceAll(new RegExp(r"\s"), "")),
              ),
            ],
          ),
        ),
      ),
    );
  }

}