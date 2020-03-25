import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Text 示例')),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('新冠肺炎疫情正在美国各州蔓延，给当地经济带来了严重影响。等等等',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 30,
                      decoration: TextDecoration.lineThrough,
                      decorationStyle: TextDecorationStyle.wavy)),
              SizedBox(height: 10.0),
              RichText(
                text: TextSpan(
                    text: '正在美国各州蔓延，',
                    style: TextStyle(color: Colors.amber, fontSize: 20),
                    children: [
                      TextSpan(text: '给当地经济带来了严重影响。'),
                      TextSpan(
                          text: '百度一下',
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              String url = 'https://www.baidu.com';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'error:$url';
                              }
                            })
                    ]),
              )
            ],
          ))),
    );
  }
}
