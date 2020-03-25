import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Container demo')),
          body: Center(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 20),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(30))),
              child: Text('Container', style: TextStyle(fontSize: 20)),
              transform: Matrix4.rotationZ(-pi / 3),
            ),
          )),
    );
  }
}
