import 'dart:isolate';

/// 58
void main() async {
  var receivePort = ReceivePort();
  await Isolate.spawn(echo, receivePort.sendPort);

  // 'echo'发送的第一个message，是它的SendPort
  // first 是 echo 线程的消息入口
  print('new isolate init begin');
  var sendPort = await receivePort.first;

  print('send msg foo');
  var msg = await sendReceive(sendPort, "foo");
  print('received $msg');
  print('send msg bar');
  msg = await sendReceive(sendPort, "bar");
  print('received $msg');
}

/// 新isolate的入口函数
echo(SendPort sendPort) async {
  print('echo isolate begin');
  // 实例化一个ReceivePort 打开接收端口以接收消息
  var port = ReceivePort();
  // 把它的 sendPort 发送给宿主 isolate， 以便宿主可以给它发送消息
  sendPort.send(port.sendPort);
  print('echo isolate notify main isolate');

  await for (var msg in port) {
    print('deal msg:${msg[0]}');
    var data = msg[0];
    SendPort replyTo = msg[1];
    replyTo.send(data);
    if (data == 'bar') port.close();
  }
}

/// 对某个port发送消息，并接收结果
Future sendReceive(SendPort port, msg) {
  ReceivePort response = ReceivePort();
  port.send([msg, response.sendPort]);
  return response.first;
}
