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
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('主页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bookmark),
            title: Text('消息'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return MyHome();
                break;
              case 1:
                return MyMessage();
                break;
            }
            return null;
          },
        );
      },
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('主页'),
        leading: Icon(CupertinoIcons.back),
        trailing: Icon(CupertinoIcons.search),
      ),
      child: Center(
        child: Text('主页'),
      ),
    );
  }
}

class MyMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('消息'),
        leading: Icon(CupertinoIcons.back),
        trailing: Icon(CupertinoIcons.search),
      ),
      child: Center(
        child: Text('消息'),
      ),
    );
  }
}
