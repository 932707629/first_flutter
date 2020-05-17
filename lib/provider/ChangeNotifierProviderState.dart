import 'package:flutterapp/provider/ChangeNotifierProvider.dart';
import 'package:flutterapp/provider/InheritedWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider> {
  void update() {
    setState(() {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<ChangeNotifier> oldWidget) {
    // TODO: implement didUpdateWidget
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // TODO: implement initState
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }

}
