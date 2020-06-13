import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WebSocketState();
  }

}

class WebSocketState extends State<WebSocketWidget> {

  TextEditingController controller=new TextEditingController();
  IOWebSocketChannel channel;
  String text="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    channel=new IOWebSocketChannel.connect('ws://echo.websocket.org');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("WebSocket(内容回显)"),
      ),
      body: new Padding(
          padding: const EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Form(
                child: new TextFormField(
                  controller: controller,
                  decoration: new InputDecoration(
                    labelText: 'Send a message',
                  ),

                ),
            ),
            new StreamBuilder(
              stream: channel.stream,
                builder: (context,snapshot){
                //网络不通会走这里
                if(snapshot.hasError){
                  text="网络不通。。。";
                }else if(snapshot.hasData){
                  text="echo:"+snapshot.data;
                }
                return new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child:new Text(text),
                );
                }
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(onPressed: sendMessage,
      tooltip: 'Send message',child: new Icon(Icons.send),),
    );
  }

  void sendMessage() {
    if(controller.text.isNotEmpty){
      channel.sink.add(controller.text);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    channel.sink.close();
    super.dispose();
  }

}