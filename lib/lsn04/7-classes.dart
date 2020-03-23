import 'dart:math';

/// 26 ~ 35
void main() {
  // 1. 普通构造函数
  // new 可省略 var point = Point(1, 2);
  var p = new Point(1, 1);
  print('$p' + ' -> {x: 1, y: 1}');
  // 可以使用 Object 类的 runtimeType 属性,获取对象的类型
  print(p.runtimeType.toString() + ' -> Point');

  // 2. 命名构造函数
  p = Point.fromJson({'x': 2, 'y': 2});
  print('$p' + ' -> {x: 2, y: 2}');

  // 3. 重定向构造函数
  p = Point.alongX(0);
  print('$p' + ' -> {x: 0, y: 0}');

  // 4. 初始化列表
  p = Point.distance(2, 3);
  print('$p' + ' -> {x: 2, y: 3}');

  // 5. 调用超类构造函数
  var child = Child.from(1, 2); // -> Parent.from, Child.from
  var child1 = Child(3, 4); // -> Parent.from, Child

  // 6. 常量构造函数
  var p2 = const Point2(4, 4);
  print('$p2' + ' -> {x: 4, y: 4}');
  // 创建的是非常量对象
  var p21 = Point2(4, 4);
  var p22 = const Point2(4, 4);
  print(identical(p2, p21).toString() + ' -> false');
  print(identical(p2, p22).toString() + ' -> true');

  // 7. 工厂方法构造函数
  var singleton1 = Singleton('qiu');
  var singleton2 = Singleton('gong');
  print(identical(singleton1, singleton2).toString() + ' -> true');

  // 7.1 工厂模式两种方式
  // 7.1.1 创建顶级函数
  var footMassage = massageFactory('foot');
  footMassage.doMassage(); // -> 脚底按摩

  // 7.1.2 创建工厂构造函数
  var footMassage1 = new Massage1('foot');
  footMassage.doMassage(); // -> 脚底按摩
  var bodyMassage = new Massage1('body');
  bodyMassage.doMassage(); // -> 全身按摩
  var specialMassage = new Massage1('%#@##@##');
  specialMassage.doMassage(); // -> 特殊按摩

  // 8. set get
  // 每个实例变量都隐含的具有一个 getter， 如果变量不是 final 的则还有一个 setter
  // 可以通过实行 getter 和 setter 来创建新的属性，
  // 使用 get 和 set 关键字定义 getter 和 setter
  var rect = new Rectangle(1, 1, 10, 10);
  print('${rect.left}' + ' -> 1');
  rect.right = 12;
  print('${rect.left}' + ' -> 2');

  // 9. implement 一个普通类
  var man = Man();
  man.work(); // -> man work

  // 10. 可调用类
  var cf = ClassFunction();
  var out = cf('qiu', 'gong', 'flutter');
  print('$out' + ' -> qiu gong flutter!');
  print(cf.runtimeType.toString() + ' -> ClassFunction');
  print(out.runtimeType.toString() + ' -> String');

  // 11. 重载操作符
  final v1 = Vector(2, 3);
  final v2 = Vector(2, 2);
  final r1 = v1 + v2;
  final r2 = v1 - v2;
  print([r1.x, r1.y].toString() + ' -> [4, 5]');
  print([r2.x, r2.y].toString() + ' -> [4, 5]');
}

class Point {
  num x;
  num y;
  var distance;

  // 普通构造函数
//  Point(num x, num y){
//    this.x = x;
//    this.y = y;
//  }

  // 简化构造
  Point(this.x, this.y);

  // 命名构造函数
  Point.fromJson(Map json) {
    x = json['x'];
    y = json['y'];
  }

  // 重定向构造函数 使用冒号调用其他构造函数
  Point.alongX(num x) : this(x, 0);

  // 初始化列表
  Point.distance(this.x, this.y) : distance = sqrt(x * x + y * y);

  @override
  String toString() {
    return 'Point{x: $x, y: $y}';
  }
}

class Parent {
  int x;
  int y;

  // 超类命名构造函数不会传递，如果希望使用超类中定义的命名构造函数创建子类，
  // 则必须在子类中实现该构造函数
  Parent.from(x, y)
      : x = x,
        y = y {
    print('Parent.from');
  }
}

class Child extends Parent {
  int x;
  int y;

  // 如果超类没有默认构造函数，则需要手动的调用超类的其他构造函数
  Child(x, y) : super.from(x, y) {
    // 调用超类构造函数的参数无法访问 this
    print('Child');
  }

  // 在构造函数的初始化列表中使用 super()，需要把它放到最后
  Child.from(x, y)
      : x = x,
        y = y,
        super.from(x, y) {
    print('Child.from');
  }
}

class Point2 {
  // 定义 const 构造函数要确保所有实例变量都是 final
  final num x;
  final num y;
  static final Point2 origin = const Point2(1, 1);

  // const 关键字放在构造函数名称之前,不能有函数体
  const Point2(this.x, this.y);

  @override
  String toString() {
    return 'Point2{x: $x, y: $y}';
  }
}

class Singleton {
  String name;

  // 工厂构造函数无法访问 this。所以这里要用 static
  static Singleton _cache;

  // 工厂构造函数，关键字factory
  // 工厂构造函数是一种构造函数,与普通构造函数不同,
  // 工厂函数不会自动生成实例,而是通过代码来决定返回的实例对象.
//  factory Singleton([String name = 'singleton']) {
//    if (Singleton._cache == null) {
//      Singleton._cache = new Singleton._newObject(name);
//    }
//    return Singleton._cache;
//  }

  factory Singleton([String name = 'singleton']) =>
      Singleton._cache ??= Singleton._newObject(name);

  // 定义一个命名构造函数用来生产实例
  Singleton._newObject(this.name);
}

Massage massageFactory(String type) {
  switch (type) {
    case 'foot':
      return new FootMassage();
    case 'body':
      return new BodyMassage();
    default:
      return new SpecialMassage();
  }
}

/////////////////////////////////////////////////
class Massage {
  void doMassage() {
    print('按摩');
  }
}

class FootMassage extends Massage {
  @override
  doMassage() {
    print('脚底按摩');
  }
}

class BodyMassage extends Massage {
  @override
  void doMassage() {
    print('全身按摩');
  }
}

class SpecialMassage extends Massage {
  @override
  void doMassage() {
    print('特殊按摩');
  }
}

/////////////////////////////////////////////////
abstract class Massage1 {
  factory Massage1(String type) {
    switch (type) {
      case 'foot':
        return new FootMassage1();
      case 'body':
        return new BodyMassage1();
      default:
        return new SpecialMassage1();
    }
  }

  void doMassage();
}

class FootMassage1 implements Massage1 {
  @override
  doMassage() {
    print('脚底按摩');
  }
}

class BodyMassage1 implements Massage1 {
  @override
  void doMassage() {
    print('全身按摩');
  }
}

class SpecialMassage1 implements Massage1 {
  @override
  void doMassage() {
    print('特殊按摩');
  }
}

/////////////////////////////////////////////////
class Rectangle {
  num left;
  num top;
  num width;
  num height;

  // getter 和 setter 的好处是，可以开始使用实例变量，
  // 后面可以把实例变量用函数包裹起来，而调用你代码的地方不需要修改。
  Rectangle(this.left, this.top, this.width, this.height);

  num get right => left + width;

  set right(num value) => left = value - width;

  num get bottom => top + height;

  set bottom(num value) => top = value - height;
}

class People {
  void work() {
    print('people work');
  }
}

class Man implements People {
  @override
  void work() {
    print('man work');
  }
}

class ClassFunction {
  call(String a, String b, String c) => '$a $b $c!';
}

class Vector {
  final int x;
  final int y;

  const Vector(this.x, this.y);

  // 重载 +
  Vector operator +(Vector v) {
    return Vector(x + v.x, y + v.y);
  }

  // 重载 -
  Vector operator -(Vector v) {
    return Vector(x - v.x, y - v.y);
  }
}
