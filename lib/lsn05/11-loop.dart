import 'dart:async';

/// 50 ~ 54
void main() {
  // 1. Future 将任务加入 event 队列
  // 2. Future 中的 then，在 Future 任务执行完后立即执行
  // 3. 如果 then 调用之前 future 已经执行完毕，那么任务会加入到 microTask 中
  // 4. Future.value，将 Task 放入 microTask 中
  // 5. Future.sync 立即放入 microTask 中，立马执行
  // 6. Future.delay 延时任务
  // testFuture(); // -> 0000,f7,100,f1,f6,f3,f5,f2,f4

  // 1. 尽量将任务放入 Event 队列中
  // 2. 使用 Future 的 then 或 whenComplete 方法来指定任务顺序
  // 3. 耗时任务不要放入 Event 和 microTask 中
  // 4. 耗时任务放入额外的 isolate 中
  testScheduleMicroTask(); // -> s9,s1,s8,s3,s4,s6,s5,s7,s2
}

void testFuture() {
  Future.value().then((_) => print('100'));
  Future.sync(() => print('0000'));

  Future f = Future(() => print('f1'));
  Future f1 = Future(() => null);
  Future f2 = Future(() => null);
  Future f3 = Future(() => null);
  f3.then((_) => print('f2'));
  f2.then((_) {
    print('f3');
    Future(() => print('f4'));
    f1.then((_) {
      print('f5');
    });
  });
  f1.then((m) {
    print('f6');
  });

  print('f7');
}

void testScheduleMicroTask() {
  scheduleMicrotask(() => print('s1'));

  Future.delayed(Duration(seconds: 1), () => print('s2'));

  Future(() => print('s3')).then((_) {
    print('s4');
    scheduleMicrotask(() => print('s5'));
  }).then((_) => print('s6'));

  Future(() => print('s7'));

  scheduleMicrotask(() => print('s8'));

  print('s9');
}
