import 'dart:core';

/// 6~14
void main() {
  /// ------------------Numbers数值:num, int, double----------------------------
  print('-----------------------Numbers------------------------');
  int i = 1; // 整数值
  double d = 1.0; // double 64-bit (双精度) 浮点数

  int bitLength = i.bitLength;
  print('bitLength: $bitLength' + ' -> 1'); // bitLength判断int值需要多少bit位
  double maxFinite = double.maxFinite;
  print('maxFinite: $maxFinite'); // maxFinite double的最大值

  // int 和 double 都是 num 的子类
  num n1 = 1;
  num n2 = 1.0;
  // 支持十进制、十六进制
  int i1 = 0xfff;
  // 科学计数法
  double d1 = 1.2e2; //120.0

  // 转换
  // String -> int
  int i2 = int.parse('1');
  double d2 = 1; // 当double的值为int值时，int自动转成double
  print('d2: $d2' + ' -> 1.0');
  int i3 = int.tryParse('1.0'); // 返回null
  print('i3: $i3' + ' -> null');
  // int->String
  String str = 123.toString(); //数字也是对象
  print('-----------------------Numbers------------------------');

  /// -------------------------Strings字符串:String-----------------------------
  print('-----------------------Strings------------------------');
  // Dart 字符串是 UTF-16 编码的字符序列，可以使用单引号或者双引号来创建字符串
  var name = 'qiu';

  // 可以在字符串中使用表达式：${expression},如果表达式是一个标识符，可以省略 {}。
  // 如果表达式的结果为一个对象，则 Dart 会调用对象的 toString() 函数来获取一个字符串
  var names = 'gong $name';
  var rawNames = r'gong ${name}'; //r 前缀可以创建一个 “原始 raw” 字符串
  print('names: $names' + ' -> gong qiu');
  print('rawNames: $rawNames');

  // 如果表达式的结果为一个对象，则 Dart 会调用对象的 toString() 函数来获取一个字符串。
  print(Map);

  // 可以使用三个单引号或者双引号也可以 创建多行字符串对象
  var multiLinesString = '''
  gong
  qiu''';
  print('multiLinesString: $multiLinesString');

  // StringBuffer
  var sb = StringBuffer();
  sb..write('aaa')..write('bbb')..write('ccc'); // ..级联符实现链式调用
  sb.writeAll(['ddd', 'eee', 'fff'], ','); // 第二个参数表示分隔符，将第一个参数列表里的数据用这个分隔符拼接起来
  print('sb: ${sb}' + ' -> aaabbbcccddd,eee,fff');
  print('-----------------------Strings------------------------');

  /// -----------------------------Booleans布尔值:bool--------------------------
  print('-----------------------Booleans------------------------');
  // bool :true 和false
  bool isNull;
  print('isNull: $isNull');
  print('-----------------------Booleans------------------------');

  /// ----------------------------Lists列表(数组):List--------------------------
  print('-----------------------Lists------------------------');
  // 声明
  // 自动长度
  List growList = List();
  growList..add(1)..add(2)..add('qiu');
  print('growableList: $growList' + ' -> [1, 2, qiu]');

  // 固定长度,使用 add 报错
  var list = List(3); // List的声明，可以用var也可用List。
  list[0] = 1;
  list[1] = 2;
  list[2] = 'qiu';
  print('list: $list' + ' -> [1, 2, qiu]');

  // 元素类型固定
  var typeList = List<int>();
  typeList.add(1);
  typeList.add(2);
  typeList.add(3);
  print('typeList: $typeList' + ' -> [1, 2, 3]');

  // 常用属性
  int first = typeList.first;
  print('typeList.first: $first' + ' -> 1'); //第一个元素
  int last = typeList.last;
  print('typeList.last: $last' + ' -> 3'); //最后一个元素
  int length = typeList.length;
  print('typeList.length: $length' + ' -> 3'); //元素个数
  bool isEmpty = typeList.isEmpty;
  print('typeList.isEmpty: $isEmpty' + ' -> false'); //是否为空
  bool isNotEmpty = typeList.isNotEmpty;
  print('typeList.isNotEmpty: $isNotEmpty' + ' -> true'); //是否不为空
  Iterable reversed = typeList.reversed;
  print('typeList.reversed: $reversed' + ' -> (3, 2, 1)'); //倒序

  // 常用方法 增删改查，排序，洗牌，复制子列表
  var list4 = [];
  // 增
  list4.add(1);
  print('add 1 :$list4' + ' -> [1]');
  list4.addAll([2, 3, 4]);
  print('addAll [2, 3, 4] :$list4' + ' -> [1, 2, 3, 4]');
  list4.insert(0, 0);
  print('insert(0, 0) :$list4' + ' -> [0, 1, 2, 3, 4]');
  list4.insertAll(1, [5, 6, 7]);
  print('insertAll(1, [5, 6, 7]) :$list4' + ' -> [0, 5, 6, 7, 1, 2, 3, 4]');

  // 删
  list4.remove(5);
  print('remove 5 :$list4' + ' -> [0, 6, 7, 1, 2, 3, 4]');
  list4.removeAt(2);
  print('remove at 0 :$list4' + ' -> [0, 6, 1, 2, 3, 4]');

  // 改
  list4[4] = 5;
  print('update list4[4] to 5 :$list4}' + ' -> [0, 6, 1, 2, 5, 4]');

  // range
  list4.fillRange(0, 3, 9);
  print('fillRange list4[0]-list4[2] to 9 :$list4}' + ' -> [9, 9, 9, 2, 5, 4]');
  Iterable getRange = list4.getRange(0, 3);
  print('getRange list4[0]-list4[2] :$getRange}' + ' -> (9, 9, 9)');

  // 查
  var contains = list4.contains(5);
  print('list4 contains 5 :$contains' + ' -> true');
  var indexOf = list4.indexOf(1);
  print('list4 indexOf 1 :$indexOf' + ' -> -1');
  int indexWhere = list4.indexWhere((ele) => ele == 5);
  print('list4 indexWhere 5 :$indexWhere' + ' -> 4');

  // 排序
  list4.sort();
  print('list4 sort :$list4' + ' -> [2, 4, 5, 9, 9, 9]');

  // 洗牌(打乱顺序)
  list4.shuffle();
  print('list4 shuffle :$list4');

  // 复制子列表(列表 0~1)
  var list5 = list4.sublist(1);
  print('sublist(1) list5 :$list5');

  // 操作符
  var list6 = [8, 9];
  print('list6 :$list6' + ' -> [8, 9]');
  var list7 = list5 + list6;
  print('list5 + list6 :$list7');
  print('-----------------------Lists------------------------');

  /// ----------------------------Maps键值对集合:Map----------------------------
  print('-----------------------Maps------------------------');
  // 声明
  // 动态类型
  var dynamicMap = Map();
  dynamicMap['name'] = 'qiu';
  dynamicMap[1] = 'android';
  print('dynamicMap :$dynamicMap' + ' -> {name: qiu, 1: android}');

  // 强类型
  var map = Map<int, String>();
  map[1] = 'android';
  map[2] = 'flutter';
  print('map :$map' + ' -> {1: android, 2: flutter}');

  // 也可以这样声明
  var map1 = {'name': 'qiu', 1: 'android'};
  map1.addAll({'name1': 'gong'});
  print('map1 :$map1' + ' -> {name: qiu, 1: android, name1: gong}');

  // 常用属性
  print((map.isEmpty).toString() + '-> false'); // 是否为空
  print((map.isNotEmpty).toString() + '-> true'); // 是否不为空
  print((map.length).toString() + ' -> 2'); // 键值对个数
  print((map.keys).toString() + ' -> (1, 2)'); // key 集合
  print((map.values).toString() + ' -> (android, flutter)'); // value集合
  print('-----------------------Maps------------------------');

  /// -----------------------------Sets集合:Set---------------------------------
  print('-----------------------Sets------------------------');
  //Set 无重复列表
  var dynamicSet = Set();
  dynamicSet.add('qiu');
  dynamicSet.add('flutter');
  dynamicSet.add(1);
  dynamicSet.add(1);
  print('dynamicSet :$dynamicSet' + ' -> {qiu, flutter, 1}');

  //常用方法 增删改查与list类似
  var set1 = {'qiu', 'flutter'};
  print('set1 :$set1' + ' -> {qiu, flutter}');
  var set2 = {'qiu', 'gong', 'dart'};
  print('set2 :$set2' + ' -> {qiu, gong, dart}');
  var difference12 = set1.difference(set2);
  var difference21 = set2.difference(set1);
  // 返回set1集合里有但set2里没有的元素集合
  print('set1 difference set2 :$difference12' + ' -> {flutter}');
  // 返回set2集合里有但set1里没有的元素集合
  print('set2 difference set1 :$difference21' + ' -> {gong, dart}');
  var intersection = set1.intersection(set2);
  // 返回set1和set2的交集
  print('set1 set2交集 :$intersection' + ' -> {qiu}');
  var union = set1.union(set2);
  // 返回set1和set2的并集
  print('set1 set2并集 :$union' + ' -> {qiu, flutter, gong, dart}');
  set2.retainAll(['qiu', 'flutter']); //只保留(要保留的元素要在原set中存在）
  print('qiu flutter :$set2' + ' -> {qiu}');
  print('-----------------------Sets------------------------');

  /// ---------------------------------Runes符号字符--------------------------------
  // Runes用于在字符串中表示Unicode字符 https://copychar.cc/emoji/
  String runesStr = '👄';
  print(runesStr);
  print(runesStr.length.toString() + ' -> 2'); // 表示占 2 个 16 位字符
  print(runesStr.runes.length.toString() + ' -> 1'); // 表示占 1 个 32 位字符

  Runes runes = new Runes('\u{1f605} \u{6211}');
  var str1 = String.fromCharCodes(runes); // 使用 String.fromCharCodes 显示字符图形
  print(str1);
  String str2 = '\u{1f605} \u{6211}'; // 如果非4个数值，需要把编码值放到大括号中
  print(str2);
}
