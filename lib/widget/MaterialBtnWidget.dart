
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialBtnWidget extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("RaisedButton"),
              onPressed: (){},
            ),
            RaisedButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              textColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: (){},
            ),
            RaisedButton.icon(
              icon: Icon(Icons.send),
              label: Text("发送"),
              onPressed: (){},
            ),
            FlatButton(
              child: Text("FlatButton"),
              onPressed: (){},
            ),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              textColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: (){},
            ),
            FlatButton.icon(
              icon: Icon(Icons.add),
              label: Text("添加"),
              onPressed: (){},
            ),
            OutlineButton(
              child: Text("OutlineButton"),
              onPressed: (){},
            ),
            OutlineButton.icon(
              icon: Icon(Icons.info),
              label: Text("详情"),
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }

}