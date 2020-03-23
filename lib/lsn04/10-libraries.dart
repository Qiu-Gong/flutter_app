import 'dart:math';

import 'package:dio/dio.dart';

import '10-mylib1.dart' as lib1;
import '10-mylib1.dart' as lib1 show Test; //只载入库的某些部分
import '10-mylib2.dart' as lib2;
import '10-mylib2.dart' as lib2 hide Test; //筛选掉库的某些部分
import '10-mylib2.dart' deferred as lazyLib; //延迟载入
import 'lib/mylib.dart';

/// 41
void main() {
  // 1. 使用核心库
  print(sqrt(4).toString() + ' -> 2.0');

  // 2. 调用第三方库
  // pubspec.yaml
  getHttp();

  // 3. 载入文件
  // 4. 如果两个库有冲突的标识符，可以为其中一个或两个库都指定前缀
  var myLib1 = lib1.MyLib();
  var myLib2 = lib2.MyLib();

  // 5. 选择性载入 show, hide
  var test = lib1.Test();
  var lib = lib2.MyLib();

  // 6. 延迟载入
  lazyLoad(); // -> Test

  // 7. 载入自定义库
  printMyLib(); // -> mylib
  printUtil(); // -> util
  printTool(); // -> tool
}

void getHttp() async {
  try {
    Response response = await Dio().get("https://www.baidu.com");
    print(response);
  } catch (e) {
    print(e);
  }
}

// 延迟载入
// 可提高程序启动速度
// 用在不常使用的功能
// 用在载入时间过长的包
lazyLoad() async {
  await lazyLib.loadLibrary();
  var t = lazyLib.Test();
  t.test();
}
