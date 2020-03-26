import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildPositionedStack(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _index = Random().nextInt(2) % 2;
          });
        },
      ),
    );
  }

  Stack buildIndexedStack() {
    return IndexedStack(
      index: _index,
      alignment: Alignment(1.2, -1.2),
      children: <Widget>[
        Container(
          color: Colors.amberAccent,
          width: 200,
          height: 200,
        ),
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.red,
        )
      ],
    );
  }

  Stack buildAlignmentStack() {
    return Stack(
      alignment: Alignment(-0.5, -1),
      children: <Widget>[
        Container(
          color: Colors.redAccent,
          width: 200,
          height: 200,
        ),
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blue,
        )
      ],
    );
  }

  Stack buildPositionedStack() {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.amber,
          width: 200,
          height: 200,
        ),
        Positioned(
          left: 10,
          top: 20,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.red,
          ),
        )
      ],
    );
  }
}
