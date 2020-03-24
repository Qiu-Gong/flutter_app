import 'dart:async';

/// 55 ~ 57 
void main() {
  // 0. 同步生成器
  // 1. 使用 sync* 返回的是 Iterable 对象
  // 2. yield 会返回 moveNext 为 true, 并等待 moveNext 指令
  // 3. 调用 getSyncGenerator 立即返回 Iterable 对象
  // 4. 调用 moveNext 方法时 getSyncGenerator 才开始执行
  var iterator = getSyncGenerator(5).iterator;
  while (iterator.moveNext()) {
    print(iterator.current);
  }

  // 0. 异步生成器
  // 1. 使用 async* 返回的是 Stream 对象
  // 2. yield 不用暂停，数据以流的方式一次性推送, 通过 StreamSubscription 进行控制
  // 3. 调用 getAsyncGenerator 立即返回 Stream,只有执行了 listen，函数才会开始执行
  // 4. listen 返回一个 StreamSubscription 对象进行流监听控制
  // 5. 可以使用 StreamSubscription 对象对数据流进行控制
  getAsyncGenerator(5).listen((value) => print(value));

  StreamSubscription subscription = getAsyncGenerator(5).listen(null);
  subscription.onData((value) {
    print('$value');
    if (value == 1) {
      subscription.pause();
    }
  });

  // 同步递归生成器
  var it = getSyncRecursiveGenerator(5).iterator;
  while (it.moveNext()) {
    print(it.current);
  }

  // 异步递归生成器
  getAsyncRecursiveGenerator(5).listen((value) => print(value));
}

Iterable<int> getSyncGenerator(int n) sync* {
  print('start');
  int k = 0;
  while (k < n) {
    yield k++;
  }
  print('end');
}

Stream<int> getAsyncGenerator(int n) async* {
  print('start');
  int k = 0;
  while (k < n) {
    yield k++;
  }
  print('end');
}

Iterable<int> getSyncRecursiveGenerator(int n) sync* {
  print('start');
  if (n > 0) {
    yield n;
    yield* getSyncRecursiveGenerator(n - 1);
  }
  print('end');
}

Stream<int> getAsyncRecursiveGenerator(int n) async* {
  print('start');
  if (n > 0) {
    yield n;
    yield* getAsyncRecursiveGenerator(n - 1);
  }
  print('end');
}
