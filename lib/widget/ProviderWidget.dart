
import 'package:firstflutter/provider/CartModel.dart';
import 'package:firstflutter/provider/ChangeNotifierProvider.dart';
import 'package:firstflutter/widget/NavBarWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
///跨组件状态管理
class ProviderWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProviderWidgetState();
  }

}

class ProviderWidgetState extends State<ProviderWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("跨组件状态管理"),
      ),
      body: Center(
        child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(builder: (context){
            return Column(
              children: <Widget>[
                Builder(builder: (context){
                  var cart =ChangeNotifierProvider.of<CartModel>(context);
                  return Text("总价: ${cart.totalPrice}");
                },),
                Builder(builder: (context){
                  print("RaisedButton build");
                  return RaisedButton(
                    child: Text("添加商品"),
                    onPressed: (){
                      ChangeNotifierProvider.of<CartModel>(context,listen: false).add(Item(20.0,1));
                    },
                  );
                },),
                //背景为蓝色  title自动为白色
                NavBarWidget(color: Colors.blue,title: "标题1",),
                //背景为白色  title自动为黑色
                NavBarWidget(color: Colors.white,title: "标题2",),
              ],
            );
          }),
        ),
      ),
    );
  }
}

