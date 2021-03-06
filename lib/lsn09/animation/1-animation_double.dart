import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Animation<double> _doubleAnimation;
  AnimationController _animationController;
  String _animationValue;

  // 四种状态
  // 1. dismissed 初始状态
  // 2. forward 从头到尾播放状态
  // 3. reverse 从尾到头播放状态
  // 4. completed 完成状态
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _doubleAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _doubleAnimation.addListener(() {
      print('value:${_doubleAnimation.value}');
      setState(() {
        _animationValue = _doubleAnimation.value.toString();
      });
    });
    _doubleAnimation.addStatusListener((status) {
      print('$status');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text(_animationValue ??= '0.0')),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              _animationController.forward(from: 0.0);
            },
            child: Icon(Icons.play_arrow)));
  }
}
