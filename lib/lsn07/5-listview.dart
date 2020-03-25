import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('ListView 示例')),
          body: Center(
            child: BuildListView(),
          )),
    );
  }
}

class BuildListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10000,
      itemBuilder: (context, index) {
        print('index:$index');
        if (index.isOdd) {
          return Divider();
        }

        return ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('$index'),
            trailing: Icon(Icons.arrow_forward));
      },
    );
  }
}

class HorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(100, (index) {
        return Text('$index ', style: TextStyle(fontSize: 20));
      }),
    );
  }
}

class NormalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('title'),
            subtitle: Text('subtitle'),
            trailing: Icon(Icons.arrow_forward)),
        Divider(),
        ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('title'),
            subtitle: Text('subtitle'),
            trailing: Icon(Icons.arrow_forward)),
        Divider(),
        ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('title'),
            subtitle: Text('subtitle'),
            trailing: Icon(Icons.arrow_forward)),
        Divider(),
        ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('title'),
            subtitle: Text('subtitle'),
            trailing: Icon(Icons.arrow_forward)),
        Divider()
      ],
    );
  }
}
