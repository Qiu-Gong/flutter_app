import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Image Demo')),
            body: Center(
              child: Column(
                children: <Widget>[
                  // 加载网络图片
                  Image.network(
                      'https://www.baidu.com/img/bd_logo1.png?where=super',
                      width: 100,
                      height: 100),

                  //加载Assets
                  Image.asset('assets/images/tzd.jpg', width: 100, height: 100),

                  //Memory
                  MemoryImageWidget(),

                  //从文件加载图片
                  FileImageWidget(),
                ],
              ),
            )));
  }
}

class MemoryImageWidget extends StatefulWidget {
  @override
  _MemoryImageWidgetState createState() => _MemoryImageWidgetState();
}

class _MemoryImageWidgetState extends State<MemoryImageWidget> {
  Uint8List _bytes;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/images/tzd.jpg').then((data) {
      if (mounted) {
        setState(() {
          _bytes = data.buffer.asUint8List();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _decoration = BoxDecoration(
        image: _bytes == null
            ? null
            : DecorationImage(image: MemoryImage(_bytes)));

    return Container(
      width: 100,
      height: 100,
      decoration: _decoration,
    );
  }
}

class FileImageWidget extends StatefulWidget {
  @override
  _FileImageWidgetState createState() => _FileImageWidgetState();
}

class _FileImageWidgetState extends State<FileImageWidget> {
  File _image;

  Future<void> getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: _image == null
              ? Text('未选择图片！')
              : Image.file(_image, width: 200, height: 200),
        ),
        FlatButton(
          onPressed: getImage,
          child: Text(
            '选图',
          ),
        )
      ],
    );
  }
}
