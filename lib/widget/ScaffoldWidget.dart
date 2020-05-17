
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return StatefulWidgetState();
  }

}

class StatefulWidgetState extends State<ScaffoldWidget> with SingleTickerProviderStateMixin{
  int selectedIndex=1;
  TabController tabController;
  List tabs=["新闻","历史","图片"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: tabs.length,vsync: this);
    tabController.addListener(() {
      print("当前页面是哪儿来"+tabController.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由页骨架"),
        leading: Builder(
          builder: (context){
            return IconButton(
              icon: Icon(Icons.dashboard,color: Colors.white,),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){

            },
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: tabs.map((e) => Tab(text: e,)).toList(),
        ),
      ),
      drawer: new Drawer(),
      body: TabBarView(
        controller: tabController,
        children: tabs.map((e){
          return Container(
            alignment: Alignment.center,
            child: Text(e,textScaleFactor: 5,),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.home),),
            SizedBox(),
            IconButton(icon: Icon(Icons.business),),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,//均分底部导航栏横向空间
        ),
      ),
      /*bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.business),title: Text("Business")),
          BottomNavigationBarItem(icon: Icon(Icons.school),title: Text("School")),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.blue,
        onTap: onItemTapped,
      ),*/
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: onAdd,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void onItemTapped(int value) {
    setState(() {
      selectedIndex=value;
    });
  }

  void onAdd() {

  }


}