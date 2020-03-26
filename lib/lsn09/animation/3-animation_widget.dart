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

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _doubleAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Center(child: MyLogo(animation: _doubleAnimation))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_animationController.status == AnimationStatus.completed) {
              _animationController.reverse();
            } else if (_animationController.status ==
                AnimationStatus.dismissed) {
              _animationController.forward();
            }
          },
        ));
  }
}

class MyLogo extends AnimatedWidget {
  final Tween<double> _rotate = Tween<double>(begin: 0.0, end: 20.0);
  final Tween<double> _scale = Tween<double>(begin: 1.0, end: 10.0);

  MyLogo({Key key, @required Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Transform.scale(
        scale: _scale.evaluate(animation),
        child: Transform.rotate(
            angle: _rotate.evaluate(animation),
            child: Container(child: FlutterLogo())));
  }
}
