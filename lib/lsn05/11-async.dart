/// 48 ~ 49
void main() {
  // getStr1 -> getName2 -> getName3 -> getStr2 -> getName1
  getName1();
  getName2();
  getName3();

  //////////////////////////////////////////////////////////////
  Future(() => futureTask()) // 异步任务的函数
      .then((v) => 'a:$v') // 任务执行完后的子任务
      .then((m) => print('b = $m')) // 其中 m 为上个任务执行完后的返回的结果
      .then((_) => Future.error('error'))
      .then((b) => print('qiu'))
      .whenComplete(() => print('whenComplete')) // 不是最后执行，通常放到最后回调
      .catchError((e) => print('cathcError:' + e), test: (Object e) {
    print('test:' + e);
    // 返回true，会被捕获。 返回false，继续抛出错误
    return true;
  }).catchError((e) => print('catchError2:' + e));
}

getStr1() {
  print('getStr1');
}

getStr2() {
  print('getStr2');
}

Future<void> getName1() async {
  // 遇到第一个 await 表达式执行暂停，返回future对象，
  // await 表达式执行完成后继续执行
  await getStr1();
  await getStr2();
  print('getName1');
}

void getName2() {
  print('getName2');
}

void getName3() {
  print('getName3');
}

int futureTask() {
  print('futureTask');
  return 100;
}
