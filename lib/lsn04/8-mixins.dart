/// 36
void main() {
  Bicycle().transport();
  Motorcycle().transport();
  Car().transport();

  // 顺序问题
  // 1. 如果2个或多个超类拥有相同签名的A方法，那么子类会以继承的最后一个超类中的A方法为准。
  // 2. 当然这是子类没有重写A方法的前提下，如果子类自己重写了A方法则以本身的A方法为准
  var ab = AB();
  var ba = BA();
  var c = C();
  var cc = CC();
  print(ab.getMessage() + ' -> B');
  print(ba.getMessage() + ' -> A');
  print(c.getMessage() + ' -> C');
  print(cc.getMessage() + ' -> B');
}

class TwoWheelTransportation {
  String powerUnit() => "两个轮子";
}

class LowSafetyIndex {
  String safetyIndex() => "low";
}

class BodyEnergyTransportation {
  String energy() => "全靠腿登";
}

class GasolineEnergyTransportation {
  String energy() => "汽油";
}

class FourWheelTransportation {
  String powerUnit() => "四个轮子";
}

class MiddleSafetyIndex {
  String safetyIndex() => "middle";
}

abstract class Transportation {
  void transport();
}

class Bicycle extends Transportation
    with TwoWheelTransportation, LowSafetyIndex, BodyEnergyTransportation {
  @override
  void transport() {
    print("自行车: "
        "动力组件:${powerUnit()}, "
        "安全指数:${safetyIndex()}, "
        "动力来源:${energy()}");
  }
}

class Motorcycle extends Transportation
    with TwoWheelTransportation, LowSafetyIndex, GasolineEnergyTransportation {
  @override
  void transport() {
    print("摩托车: "
        "动力组件:${powerUnit()}, "
        "安全指数:${safetyIndex()}, "
        "动力来源:${energy()}");
  }
}

class Car extends Transportation
    with
        FourWheelTransportation,
        MiddleSafetyIndex,
        GasolineEnergyTransportation {
  @override
  void transport() {
    print("汽车: "
        "动力组件:${powerUnit()}, "
        "安全指数:${safetyIndex()}, "
        "动力来源:${energy()}");
  }
}

/////////////////////////////////////////////////
class A {
  String getMessage() => 'A';
}

class B {
  String getMessage() => 'B';
}

class P {
  String getMessage() => 'P';
}

class AB extends P with A, B {}

class BA extends P with B, A {}

class C extends P with B, A {
  String getMessage() => 'C';
}

// 这里的 implement 只是表明要实现 A 的方法，
// 这个时候具体实现是再 B 中 mixin 了具体实现
class CC extends P with B implements A {}
