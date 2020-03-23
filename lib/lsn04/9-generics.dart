/// 37 ~ 40
void main() {
  // 1. 使用泛型，很多的容器对象，
  // 在创建对象时都可以定义泛型类型,跟java一样
  var list = List<String>();
  list.add('aaa');
  list.add('bbb');
  list.add('ccc');
  print(list.toString() + ' -> [aaa, bbb, ccc]');

  var map = Map<int, String>();
  map[1] = 'aaaa';
  map[2] = 'bbbb';
  map[3] = 'cccc';
  print(map.toString() + ' -> {1: aaaa, 2: bbbb, 3: cccc}');

  K addCache<K, V>(K key, V value) {
    K temp = key;
    print('$key : $value' + ' -> qiu : gong');
    return temp;
  }

  var key = addCache('qiu', 'gong');
  print(key.toString() + ' -> qiu');

  // 2. 构造函数泛型
  var p = Phone<String>('123456');
  print(p.number + ' -> 123456');

  // 3. 泛型限制， 通过 extends 关键字限定可泛型使用的类型
  var footMassage = FootMassage();
  var m = Massage<FootMassage>(footMassage);
  m.massage.doMassage(); // -> foot

  // 4. 运行时可判断泛型
  var names = List<String>();
  print((names is List<String>).toString() + ' -> true');
  print(names.runtimeType.toString() + ' -> List<String>');
}

class Phone<T> {
  final T number;

  Phone(this.number);
}

class FootMassage {
  void doMassage() {
    print('foot');
  }
}

class Massage<T extends FootMassage> {
  final T massage;

  Massage(this.massage);
}
