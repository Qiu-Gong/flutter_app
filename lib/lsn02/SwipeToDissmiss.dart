import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> list = List.generate(20, (index) => "$index 元素");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Title")),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(list[index]),
            direction: DismissDirection.endToStart,
            child: ListTile(title: Text('${list[index]}')),
            background: Container(color: Colors.amber),
            onDismissed: (direction) {
              setState(() {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("${list[index]}")));
                list.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }
}
