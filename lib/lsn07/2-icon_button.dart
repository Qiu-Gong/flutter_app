import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Icon Button 示例')),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.person),
              SizedBox(height: 10),
              IconButton(
                  icon: Icon(Icons.error),
                  onPressed: () {
                    print('IconButton');
                  }),
              Container(height: 10, color: Colors.blue),
              RaisedButton(
                  onPressed: () {
                    print('RaisedButton');
                  },
                  child: Text('RaisedButton'))
            ],
          ))),
    );
  }
}
