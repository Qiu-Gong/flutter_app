/// 20
main() {
  // Operators 操作符
  /// ------------------------------- 后缀操作符 ?. ----------------------------
  // 条件成员访问和 . 类似，但是左边的操作对象不能为 null，
  // 例如 foo?.bar 如果 foo 为 null 则返回 null，否则返回 bar 成员
  String a;
  print(a?.length.toString() + ' -> null');

  /// -------------------------------取商操作符 ~/------------------------------
  // 被除数 ÷ 除数 = 商 ... 余数，A ~/ B = C，这个C就是商。相当于Java里的 /
  print((2 / 3).toString() + ' -> 0.66');
  print((2 ~/ 3).toString() + ' -> 0');

  /// -------------------------------类型判定操作符-----------------------------
  // 类型判定操作符：as、is、is!在运行时判定对象类型
  // as 类型转换
  num iNum = 1;
  num dNum = 1.0;
  int i = iNum as int;
  double d = dNum as double;
  print([i, d].toString() + ' -> [1, 1.0]');

  // 类型转化失败
  //  String s = iNum as String;

  // is 如果对象是指定的类型返回 True
  print((iNum is int).toString() + ' -> true');
  Child child;
  Child child1 = new Child();
  print((child is Parent).toString() + ' -> false'); // child is Null
  print((child1 is Parent).toString() + ' -> true');

  // is! 如果对象是指定的类型返回 False
  print((iNum is! int).toString() + ' -> false');

  /// ---------------------------------条件表达式-------------------------------
  // 三目运算符 condition ? expr1 : expr2
  bool isFinish = true;
  String txtVal = isFinish ? 'yes' : 'no';
  print(txtVal + ' -> yes');
  // expr1 ?? expr2，如果 expr1 是 non-null，返回其值；否则执行 expr2 并返回其结果。
  bool isPaused;
  isPaused = isPaused ?? false;
  // 也可以这样写
  isPaused ??= false;
  print(isPaused.toString() + ' -> false');

  /// ---------------------------------级联操作符-------------------------------
  // .. 可以在同一个对象上 连续调用多个函数以及访问成员变量。
  // 严格来说， 两个点的级联语法不是一个操作符。 只是一个 Dart 特殊语法。
  StringBuffer sb = new StringBuffer();
  sb
    ..write('qiu ')
    ..write('flutter ')
    ..writeln('gong');
  print(sb.toString() + ' -> qiu flutter gong');
}

class Parent {}

class Child extends Parent {}
