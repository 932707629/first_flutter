import 'dart:collection';

import 'package:flutter/cupertino.dart';

class CartModel extends ChangeNotifier {
  //用于保存购物车中的商品列表
  final List<Item> _items = [];

  //禁止改变购物车里的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  double get totalPrice=>_items.fold(0, (value, item) => value +item.count*item.price);

  void add(Item item){
    _items.add(item);
    //通知监听器,重新构建InheritedProvider,更新状态
    notifyListeners();
  }

}

class Item {
  Item(this.price, this.count);

  double price; //商品单价
  int count; //商品数量
}
