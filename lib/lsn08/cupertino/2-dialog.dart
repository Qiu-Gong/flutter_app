import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Cupertino App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoAlertDialog(
        title: Text('标题'),
        content: Text('aaaa'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('确定'),
          ),
          CupertinoDialogAction(
            child: Text('取消'),
            textStyle: TextStyle(color: CupertinoColors.activeBlue),
          ),
        ],
      ),
    );
  }
}
