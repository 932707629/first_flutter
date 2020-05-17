import 'package:flutterapp/Iconfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageIconWidget extends StatelessWidget{

  final String imageUrl="https://bkimg.cdn.bcebos.com/pic/574e9258d109b3de43046931c3bf6c81800a4c34?x-bce-process=image/resize,m_lfit,w_500,h_500,limit_1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片和图标"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Image.asset("images/default_avatar.png",width: 100),
            Image.network(imageUrl,width: 100,),
            Image(
              image: NetworkImage(imageUrl),
              width: 100,
              fit: BoxFit.cover,
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.accessible,color: Colors.green,size: 50,),
                  Icon(Icons.error,color: Colors.green,size: 50,),
                  Icon(Icons.fingerprint,color: Colors.green,size: 50,),
                ],
              )
          ],
        ),
      ),
    );
  }

}