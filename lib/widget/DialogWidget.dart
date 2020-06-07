
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///各种弹窗
class DialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("各种弹窗"),
      ),
      body: Builder(builder: (BuildContext context){
        return Wrap(
          spacing: 4.0,
          runSpacing: 4.0,
          alignment: WrapAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("对话框1"),
              onPressed: () async {
                bool delete = await showDeleteConfirmDialog1(context);
                if (delete == null) {
                  print("取消删除");
                } else {
                  print("已确认删除");
                  //...删除文件
                }
              },
            ),
            RaisedButton(
              child: Text("对话框2"),
              onPressed: () async {
                changeLanguage(context);
              },
            ),
            RaisedButton(
              child: Text("对话框3"),
              onPressed: () async {
                showListDialog(context);
              },
            ),
            RaisedButton(
              child: Text("对话框4"),
              onPressed: () async {
                showCustomDialog<bool>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("提示"),
                        content: Text("您确定要删除当前文件嘛?"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("取消"),
                            onPressed: () => Navigator.of(context).pop(), //关闭对话框,
                          ),
                          FlatButton(
                            child: Text("删除"),
                            onPressed: () =>
                                Navigator.of(context).pop(true), //关闭对话框,
                          ),
                        ],
                      );
                    });
              },
            ),
            RaisedButton(
              child: Text("对话框5"),
              onPressed: () async {
                showDeleteConfirmDialog4(context);
              },
            ),
            RaisedButton(
              child: Text("底部菜单弹出框"),
              onPressed: () async {
                Future<int> type=_showModelBottomSheet(context);
                print(type.toString());
              },
            ),
            RaisedButton(
              child: Text("底部全屏菜单弹出框"),
              onPressed: () async {
                print("object胡乱打印一下");

                var dialog=_showBottomSheet(context);
              },
            ),
            RaisedButton(
              child: Text("加载框"),
              onPressed: () async{
                showLoadingDialog(context);
              },
            ),
            RaisedButton(
              child: Text("日历(MD)"),
              onPressed: () async{
                showDatePicker1(context);
              },
            ),
            RaisedButton(
              child: Text("日历(iOS)"),
              onPressed: () async{
                showDatePicker2(context);
              },
            ),
          ],
        );
      })
    );
  }

  Future<bool> showDeleteConfirmDialog1(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件嘛?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), //关闭对话框,
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () => Navigator.of(context).pop(true), //关闭对话框,
            ),
          ],
        );
      },
    );
  }

  Future<void> changeLanguage(BuildContext context) async {
    int i = await showDialog<int>(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("请选择语言"),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });
    if (i != null) {
      print("选择了:${i == 1 ? "中文简体" : "美国英语"}");
    }
  }

  Future<void> showListDialog(BuildContext context) async {
    int index = await showDialog(
      context: context,
      builder: (context) {
        var child = Column(
          children: <Widget>[
            ListTile(
              title: Text("请选择"),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("$index"),
                    onTap: () => Navigator.of(context).pop(index),
                  );
                },
                itemCount: 30,
              ),
            ),
          ],
        );
        return Dialog(
          child: child,
        );
      },
    );
    if (index != null) {
      print("点击了:$index");
    }
  }

  ///自定义了一个dialog
  Future<T> showCustomDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(
          builder: builder,
        );
        return SafeArea(
          child: Builder(
            builder: (BuildContext context) {
              return theme != null
                  ? Theme(
                      data: theme,
                      child: pageChild,
                    )
                  : pageChild;
            },
          ),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black87,
      transitionDuration: const Duration(microseconds: 150),
      transitionBuilder: buildMateralDialogTransitions,
    );
  }

  Widget buildMateralDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      ),
      child: child,
    );
  }

  ///带有删除子文件夹选择框的
  Future<bool> showDeleteConfirmDialog4(BuildContext context) {
    bool withTree = true;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件嘛?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录?"),
                  Builder(
                    builder: (BuildContext context) {
                      return Checkbox(
                        value: withTree,
                        onChanged: (value) {
                          (context as Element).markNeedsBuild();
                          withTree = !withTree;
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), //关闭对话框,
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () => Navigator.of(context).pop(withTree), //关闭对话框,
            ),
          ],
        );
      },
    );
  }

  Future<int> _showModelBottomSheet(BuildContext context) {
    return showModalBottomSheet<int>(
        context: context,
        builder: (context) {
          return ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              });
        });
  }

  PersistentBottomSheetController<int> _showBottomSheet(BuildContext context) {
    return showBottomSheet<int>(context: context, builder: (context){
      return ListView.builder(
        itemCount: 30,
          itemBuilder: (context,index){
            return ListTile(
              title: Text("$index"),
              onTap: () => {
                print("$index"),
                Navigator.of(context).pop(),
              },
            );
      });
    });
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(context: context,
    barrierDismissible: false,//点击遮罩不关闭对话框
    builder: (context){
      return UnconstrainedBox(
        constrainedAxis: Axis.vertical,
        child: SizedBox(
          width: 280,
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(value: 0.8,),
                Padding(
                  padding: const EdgeInsets.only(top: 26.0),
                  child: Text("正在加载,请稍后..."),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Future<DateTime> showDatePicker1(BuildContext context) {
    var date=DateTime.now();
    return showDatePicker(context: context,
      initialDate: date, firstDate: date,
      lastDate: date.add(Duration(days: 30),),);
  }

  Future<DateTime> showDatePicker2(BuildContext context) {
    var date=DateTime.now();
    return showCupertinoModalPopup(context: context, builder: (context){
      return SizedBox(
        height: 200,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.dateAndTime,
          backgroundColor: Colors.white,
          minimumDate: date,
          maximumDate: date.add(Duration(days: 30)),
          maximumYear: date.year+1,
          onDateTimeChanged: (value){
            print(value);
          },
        ),
      );
    });
  }

}
