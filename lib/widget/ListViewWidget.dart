
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*class ListViewWidget extends StatelessWidget{
  final Widget divider1=Divider(color: Colors.blue,);
  final Widget divider2=Divider(color: Colors.green,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context,int index){
        return ListTile(title: Text("$index"),);
      }, separatorBuilder: (BuildContext context,int index){
        return index%2==0?divider1:divider2;
      }, itemCount: 100),
    );
  }

}*/

class ListViewWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return ListViewWidgetState();
  }

}

class ListViewWidgetState extends State<ListViewWidget>{

  static const loadingTag="###loading###";
  var words=<String>[loadingTag];

  ScrollController scrollController=new ScrollController();
  bool showToTopBtn=false;//是否显示"返回到顶部"按钮

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if(scrollController.offset<1000&&showToTopBtn){
        setState(() {
          showToTopBtn=false;
        });
      }else if(scrollController.offset>=1000&&showToTopBtn==false){
        setState(() {
          showToTopBtn=true;
        });
      }
    });
    retrieveData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(title: Text("单词列表"),),
          Expanded(
            child: ListView.separated(
                itemBuilder: (BuildContext context,int index){
                  if(words[index]==loadingTag){
                    if(words.length-1<100){
                      retrieveData();
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(strokeWidth: 2.0,),
                        ),
                      );
                    }else{
                      return Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(16.0),
                        child: Text("没有更多了",style: TextStyle(color: Colors.grey),),
                      );
                    }
                  }
                  return ListTile(title: Text(words[index]),);
                }, separatorBuilder: (BuildContext context,int index){
              return Divider(height: 0,);
            }, itemCount: words.length,controller: scrollController,),
          ),
        ],
      ),
      floatingActionButton: !showToTopBtn?null:FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: (){
          scrollController.animateTo(0, duration: Duration(microseconds: 200), curve: Curves.ease);
        },
      ),
    );
  }

  void retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((value){
      words.insertAll(words.length-1,
      generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        //重新构建列表
      });
    });

  }
}