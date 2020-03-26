import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('GridView 示例')),
          body: Center(
            child: CountGridView(),
          )),
    );
  }
}

class CountGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 3,
        scrollDirection: Axis.horizontal,
        childAspectRatio: 1,
        children: List.generate(100, (index) {
          return Container(
            color: Colors.red,
            margin: EdgeInsets.all(10),
            child:
                Center(child: Text('$index', style: TextStyle(fontSize: 10))),
          );
        }));
  }
}

class BuildGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 1),
      itemBuilder: (context, index) {
        print('index:$index');
        return Container(
          color: Colors.amber,
          margin: EdgeInsets.all(10),
          child: Center(child: Text('$index', style: TextStyle(fontSize: 20))),
        );
      },
    );
  }
}
