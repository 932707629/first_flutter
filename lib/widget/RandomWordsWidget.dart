import 'package:flutter/cupertino.dart';

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('images/back_gray_icon.png');
//    return new DecoratedBox(
//        decoration: new BoxDecoration(
//            image: new DecorationImage(
//                image: new AssetImage('images/back_gray_icon.png'))));
  }

//  @override
//  Widget build(BuildContext context) {
//    final wordPair=new WordPair.random();
//    return Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: new Text(wordPair.toString()),
//    );
//  }

}
