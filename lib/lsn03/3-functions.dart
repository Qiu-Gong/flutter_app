/// 15~19
void main() {
  // 普通函数定义
  int add(int x, int y) {
    return x + y;
  }

  print(add(1, 2).toString() + ' -> 3');

  // 所有的函数都返回一个值。如果没有指定返回值，则默认把语句 return null;
  // 作为函数的最后一个语句执行。
  testFunc() {}
  print(testFunc().toString() + ' -> null');

  // 可省略类型(不建议)
  add1(x, y) {
    return x + y;
  }

  print(add1('1', '2').toString() + ' -> 12');
  print(add1(1, 2).toString() + ' -> 3');

  // 箭头函数：=>表达式
  int add2(int x, int y) => x + y;

  // 可选命名参数：使用 {param1, param2, …} 的形式来指定命名参数
  int add3({int x, int y, int z}) {
    x ??= 1;
    y ??= 2;
    z ??= 3;
    return x + y + z;
  }

  print(add3().toString() + ' -> 6');
  print(add3(x: 3).toString() + ' -> 8');

  // 可选位置参数：把可选参数放到 [] 中，必填参数要放在可选参数前面
  int add4(int x, [int y, int z]) {
    y ??= 2;
    z ??= 3;
    return x + y + z;
  }

  print(add4(1).toString() + ' -> 6');
  print(add4(1, 10).toString() + ' -> 14');
  print(add4(1, 10, 5).toString() + ' -> 16');

  // 可选命名参数默认值(默认值必须是编译时常量),目前可以使用等号'='或冒号':'
  int add5(int x, {int y = 2, int z = 3}) {
    return x + y + z;
  }

  print(add5(1, y: 10, z: 2).toString() + ' -> 13');

  // 可选位置参数默认值(默认值必须是编译时常量),只能使用等号'='
  int add6(int x, [int y = 2, int z = 3]) {
    return x + y + z;
  }

  print(add6(1).toString() + ' -> 6');

  // 使用list或map作为默认值，但必须是const
  void func(
      {List list = const [1, 2, 3], Map map = const {1: 1, 'name': 'qiu'}}) {
    print(list.toString() + ' -> [1, 2, 3]');
    print(map.toString() + ' -> {1: 1, name: qiu}');
  }

  func();

  // 匿名函数, 赋值给变量, 无参匿名函数
  var anonFunc1 = () => print('无参匿名函数');
  anonFunc1();

  // 有参匿名函数
  var anonFunc = (name) => 'I am $name';
  print(anonFunc('qiu') + ' -> I am qiu');

  // 通过()调用，不推荐
  (() => print('不推荐'))();

  // 匿名函数传参
  List test(List list, String func(str)) {
    for (var i = 0; i < list.length; i++) {
      list[i] = func(list[i]);
    }
    return list;
  }

  var list = ['q', 'i', 'u'];
  print(test(list, (str) => str * 2).toString() +
      ' -> [qq, ii, uu]'); // String * int

  // List.forEach() 就用的匿名函数
  List list1 = [11, 12, 13];
  list1.forEach((item) => print('$item')); // 11 12 13

  // 返回Function对象（闭包）
  Function makeAddFun(int x) {
    x++;
    return (int y) => x + y;
  }

  var addFunc = makeAddFun(2);
  print(addFunc(3).toString() + ' -> 6');

  // 函数别名
  MyFunc myFunc;
  // 可以指向任何同签名的函数
  myFunc = subtract;
  myFunc(4, 2); // subtract: 2
  myFunc = divide;
  myFunc(4, 2);// divide: 2.0
  calculator(4, 2, subtract);// subtract: 2
}

//函数别名
typedef MyFunc(int a, int b);
// 根据MyFunc相同的函数签名定义两个函数
subtract(int a, int b) {
  print('subtract: ${a - b}');
}
divide(int a, int b) {
  print('divide: ${a / b}');
}
// typedef 也可以作为参数传递给函数
calculator(int a, int b, MyFunc func) {
  func(a, b);
}
