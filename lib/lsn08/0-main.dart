import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MaterialApp',
        routes: {
          '/other': (context) => OtherPage(),
          '/message': (context) => MessagePage()
        },
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  static final List<String> _message = ['信息', '通讯录', '发现', '我'];
  final _widgetOptions = [
    Text(_message[0]),
    Text(_message[1]),
    Text(_message[2]),
    Text(_message[3])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialApp'),
        leading: Icon(Icons.star),
        actions: <Widget>[Icon(Icons.search), Icon(Icons.more_vert)],
      ),
      body: Center(child: _widgetOptions.elementAt(_currentIndex)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/message');
        },
        foregroundColor: Colors.amber,
        backgroundColor: Colors.red,
        elevation: 1.5,
        child: Icon(Icons.arrow_forward),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.message), title: Text(_message[0])),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), title: Text(_message[1])),
          BottomNavigationBarItem(
              icon: Icon(Icons.near_me), title: Text(_message[2])),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text(_message[3]))
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      drawer: BuildDrawer(),
    );
  }
}

class BuildDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/women/17.jpg'),
            ),
            accountName: Text('Qiu'),
            accountEmail: Text('178438297@qq.com'),
            otherAccountsPictures: <Widget>[Icon(Icons.camera_alt)],
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/tzd.jpg'),
                    fit: BoxFit.fill)),
          ),
          ListTile(leading: Icon(Icons.payment), title: Text('会员特权')),
          ListTile(leading: Icon(Icons.payment), title: Text('会员特权')),
          ListTile(leading: Icon(Icons.payment), title: Text('会员特权')),
          AboutListTile(
              icon: Icon(Icons.error),
              child: Text('关于'),
              applicationName: 'MaterialApp',
              applicationVersion: '1.0')
        ],
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('OtherPage')));
  }
}

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('MessagePage')));
  }
}
