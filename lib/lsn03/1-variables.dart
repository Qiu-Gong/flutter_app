import 'dart:core';

/// 2~5 页 ppt
void main() {
  /// ---------------------------------变量的声明-------------------------------
  // 声明一个未初始化的变量，变量的类型可改变
  var data;
  data = 'qiu';
  data = 123;

  dynamic data1;
  data1 = 'qiu';
  data1 = 123;

  Object data2;
  data2 = 'qiu';
  data2 = 123;

  print('values:${[data, data1, data2]}' + ' -> [123, 123, 123]');

  // var声明一个初始化的变量，变量的类型不能再改变
  // 变量是一个引用。名字为 variable1 的变量引用了一个内容为 “qiu” 的 String 对象。
  var variable1 = 'qiu';
  // 变量初始化后，variable1 变量的类型被推断为 String 类型，其类型不能再改变
  // variable1 = 123;

  // dynamic 和 Object 声明的变量初始化后，变量的类型仍可改变
  dynamic variable2 = 'qiu';
  variable2 = 123;
  // 调用不存在的test()方法，编译通过，运行报异常。编译阶段不检查类型
  //  variable2.test();

  Object variable3 = 'dongnao';
  variable3 = 123;
  // 调用不存在的test()方法，编译不通过。编译阶段检查类型
  //  variable3.test();

  // 使用确定类型显示声明变量，变量的类型不能再改变
  String name3;
  name3 = 'qiu';
  // 变量的类型不能再改变
  //  name3 = 123;

  // var:如果没有初始值，可以变成任何类型
  // dynamic:动态任意类型，编译阶段不检查类型
  // Object:动态任意类型，编译阶段检查类型
  // 区别：唯一区别 var 如果有初始值，类型被锁定

  /// ---------------------------------默认值-----------------------------------
  // 没有初始化的变量默认值都是 null。一切皆对象，对象的默认值是 null
  bool isEmpty;
  assert(isEmpty == null);

  /// ---------------------------------final和 const----------------------------
  //1. 被 final 或者 const 修饰的变量，变量类型可以省略
  final String fVariable2 = 'qiu';
  final fVariable1 = 'qiu';
  const String cfVariable2 = 'qiu';
  const cVariable1 = 'qiu';

  //2. 被 final 或 const 修饰的变量无法再去修改其值。
  //  fVariable1 = 'damon';
  //  cVariable1 = 'damon';

  //3. final 或 const 不能和 var 同时使用。
  //  final var fVariable3 = 'qiu';
  //  const var cVariable3 = 'qiu';

  //4. 如果是类级别常量，使用 static const
  // 可参照 DateTime -> static const int monday = 1;
  DateTime;

  //5. const 可以使用其他 const常量的值 来初始化其值
  const width = 100;
  const height = 100;
  const square = width * height;

  //6. const 赋值声明可省略
  const List clist = [1, 2, 3];
  // dart2 之前，const 赋值必须用 const 声明
  const List clist2 = const [1, 2, 3];

  //7. 可以更改非 final, 非 const 变量的值，即使它曾经具有 const 值
  var varList = const [1, 2, 3];
  final finalList = const [1, 2, 3];
  const constList = const [1, 2, 3];
  varList = [1];
  //  constList = [1];
  //  finalList = [1];

  //8. const 导致的不可变性是可传递的
  final List ls = [1, 2, 3];
  ls[1] = 4;
  print('ls:$ls' + ' -> [1, 4, 3]');
  const List ls1 = [1, 2, 3];
  // 可编译，运行报错
  //  ls1[1] = 4;

  //9. 相同的const常量不会在内存中重复创建
  final finalList1 = [1, 2];
  final finalList2 = [1, 2];
  // identical用于检查两个引用是否指向同一个对象
  print('finalList1 == finalList2 ${identical(finalList1, finalList2)} -> false');
  const constList1 = [1, 2];
  const constList2 = [1, 2];
  print('constList1 == constList2 ${identical(constList1, constList2)} -> true');

  //10. const 需要是编译时常量
  final DateTime finalDateTime = DateTime.now();
  // DateTime.now() 是运行期计算出来的值
  //  const DateTime constDateTime = DateTime.now();
  // 使用内置数据类型的字面量通过基本运算得到的值
  const sum = 1 + 2;
  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = 'a constant string';
  const aConstNull = null;
  const validConstString =
      '$aConstNum, $aConstBool, $aConstString, $aConstNull';
  print(validConstString + ' -> 0, true, a constant string, null');
}
