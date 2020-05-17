
import 'package:flutter/cupertino.dart';

//监听页面路由跳转
class RouteObservers extends NavigatorObserver{

  @override
  void didPush(Route route, Route previousRoute) {
    // TODO: implement didPush
    super.didPush(route, previousRoute);
    print("当前路由页: $route.settings.name");

  }


}