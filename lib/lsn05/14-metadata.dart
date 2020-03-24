import '14-todo.dart';

/// 59 ~ 61
void main() {
  var tv = Television();
  tv.activate();
  tv.turnOn();
  tv.turnOff();
}

class Television {
  @deprecated
  void activate() {
    turnOn();
  }

  void turnOn() {
    print('Television turn on!');
  }

  void turnOff() {
    print('Television turn off!');
  }

  @override
  noSuchMethod(Invocation mirror) {
    print('没有找到方法');
  }

  @Todo(who: 'qiu', what: 'create a new method')
  void doSomething() {
    print('doSomething');
  }
}
