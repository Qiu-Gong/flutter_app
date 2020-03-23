class MyLib {
  String name;
  static MyLib _cache;

  factory MyLib([String name = 'singleton']) =>
      MyLib._cache ??= MyLib._newObject(name);

  MyLib._newObject(this.name);
}

class Test {
  void test() => print('Test');
}
