import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return GridViewWidgetState();
  }

}

class GridViewWidgetState extends State<GridViewWidget> {
  List<IconData> icons=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
          ),
          itemCount: icons.length,
          itemBuilder: (context,index){
            if(index==icons.length-1&&icons.length<200){
              retrieveIcons();
            }
            return Icon(icons[index]);
          }),
    );
  }

  void retrieveIcons() {
    Future.delayed(Duration(microseconds: 200))
        .then((value)  {
          setState(() {
            icons.addAll([
              Icons.ac_unit,
              Icons.airport_shuttle,
              Icons.all_inclusive,
              Icons.beach_access,
              Icons.cake,
              Icons.free_breakfast,

            ]);
          });
    });
  }


}