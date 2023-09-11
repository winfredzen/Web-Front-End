# Dart

教程地址：

+ [Dart 简介](https://dart.cn/language)
+ [Introduction to Dart](https://dart.dev/language)



> Everything you can place in a variable is an *object*, and every object is an instance of a *class*. Even numbers, functions, and `null` are objects. With the exception of `null` (if you enable [sound null safety](https://dart.cn/null-safety)), all objects inherit from the [`Object`](https://api.dart.cn/stable/dart-core/Object-class.html) class.
>
> 可以放入变量中的所有内容都是对象，每个对象都是类的实例。 甚至数字、函数和 `null` 都是对象。 除了 `null` 之外（如果启用健全的 `null` 安全性），所有对象都继承自 `Object` 类。





## 基本

`main()` 函数来作为运行入口



### 变量

用 `var` 来定义变量，而不用显式指定它们的类型，支持类型推断

```dart
var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'
};
```

也可以显示的声明：

```dart
String name = 'Bob';
```



### 常量

使用`final`或者`const`

```dart
  final name = 'Bob'; // Without a type annotation
  final String nickname = 'Bobby';
  name = 'Alice'; // Error: a final variable can only be set once.
```

`final`变量在第一次使用时被初始化

`const`变量是一个编译时常量

```dart
const bar = 1000000; // Unit of pressure (dynes/cm2)
const double atm = 1.01325 * bar; // Standard atmosphere
```

常量如果是类级别的，可以使用`static const`

```dart
static const PI = 3.1415;
```



### Numbers

数值型分整型`int`和浮点型`double`，可以用`num`、`int`、`double`声明

`int`、`double`都是`num`的subtype

```dart
abstract final class int extends num
abstract final class double extends num
```

`num`声明的变量如果是`int`型，还可以被改成`double`型

```dart
  num x = 1; // x can have both int and double values
  x += 2.5;
  print(x);
```

但是，反过来`int`声明的变量不能再赋值成`double`型

```dart
  int b = 20;
  b = 2.5;// Error: A value of type 'double' can't be assigned to a variable of type 'int'.
```



**字符串和数值的相互转换**

```dart
// String -> int
var one = int.parse('1');
assert(one == 1);

// String -> double
var onePointOne = double.parse('1.1');
assert(onePointOne == 1.1);

// int -> String
String oneAsString = 1.toString();
assert(oneAsString == '1');

// double -> String
String piAsString = 3.14159.toStringAsFixed(2);
assert(piAsString == '3.14');
```



###  Strings

使用单引号、双引号创建字符串

```dart
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";
```

上面的两者是等价的

插值表达式`${expression}`

```dart
var s = 'string interpolation';

assert('Dart has $s, which is very handy.' ==
    'Dart has string interpolation, '
        'which is very handy.');
```



**多行字符串**

```dart
var s1 = '''
You can create
multi-line strings like this one.
''';

var s2 = """This is also a
multi-line string.""";
```



**Raw字符串**

```dart
var s = r'In a raw string, not even \n gets special treatment.';
```



### 布尔型

使用`bool`表示布尔型，布尔值只有`true`和`false`



### List

```dart
var list = [1, 2, 3];

var list = [
  'Car',
  'Boat',
  'Plane',
];
```

创建不可变的list

```dart
  var constantList = const [1, 2, 3];
  //constantList[1] = 1; // This line will cause an error.
```



### Set

```dart
var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
```

创建控set，可使用`{}`

```dart
var names = <String>{};
// Set<String> names = {}; // This works, too.
// var names = {}; // Creates a map, not a set.
```

创建不可变set

```dart
final constantSet = const {
  'fluorine',
  'chlorine',
  'bromine',
  'iodine',
  'astatine',
};
// constantSet.add('helium'); // This line will cause an error.
```



### Map

直接声明式创建Map

```dart
var gifts = {
  // Key:    Value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 'golden rings'
};
```

构造方式：

```dart
var gifts = Map<String, String>();
gifts['first'] = 'partridge';
gifts['second'] = 'turtledoves';
gifts['fifth'] = 'golden rings';

var nobleGases = Map<int, String>();
nobleGases[2] = 'helium';
nobleGases[10] = 'neon';
nobleGases[18] = 'argon';
```

创建不可变map

```dart
final constantMap = const {
  2: 'helium',
  10: 'neon',
  18: 'argon',
};

// constantMap[2] = 'Helium'; // This line will cause an error.
```



### 展开操作符**spread operator** (`...`)

```dart
  List<int> list1 = [1, 2, 3];
  List<int> list2 = [4, 5, 6];
  List<int> combinedList = [...list1, ...list2];

  print(combinedList); // [1, 2, 3, 4, 5, 6]
```

如果操作的对象可能为null，使用`null-aware spread operator` (`...?`):

```dart
var list2 = [0, ...?list];
assert(list2.length == 1);
```





###  级联运算符..(Cascade notation)

参考：

+ [ Cascade notation](https://dart.dev/language/operators#cascade-notation)

Cascades (`..`, `?..`) allow you to make a sequence of operations on the same object

```dart
var paint = Paint()
  ..color = Colors.black
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 5.0;
```

等价于：

```dart
var paint = Paint();
paint.color = Colors.black;
paint.strokeCap = StrokeCap.round;
paint.strokeWidth = 5.0;
```

如果对象可能为null，使用*null-shorting* cascade (`?..`) 

```dart
querySelector('#confirm') // Get an object.
  ?..text = 'Confirm' // Use its members.
  ..classes.add('important')
  ..onClick.listen((e) => window.alert('Confirmed!'))
  ..scrollIntoView();
```

等同于：

```dart
var button = querySelector('#confirm');
button?.text = 'Confirm';
button?.classes.add('important');
button?.onClick.listen((e) => window.alert('Confirmed!'));
button?.scrollIntoView();
```



### dynamic 和 Object

`Object` 是 Dart 所有对象的根基类

`dynamic`与`Object`声明的变量都可以赋值任意对象，且后期可以改变赋值的类型，这和 `var` 是不同的，如：

```dart
dynamic t;
Object x;
t = "hi world";
x = 'Hello Object';
//下面代码没有问题
t = 1000;
x = 1000;
```

`dynamic`与`Object`不同的是`dynamic`声明的对象编译器会提供所有可能的组合，而`Object`声明的对象只能使用 `Object` 的属性与方法, 否则编译器会报错，如:

```dart
 dynamic a;
 Object b = "";
 main() {
   a = "";
   printLengths();
 }   

 printLengths() {
   // 正常
   print(a.length);
   // 报错 The getter 'length' is not defined for the class 'Object'
   print(b.length);
 }
```



## 函数

如下的函数：

```dart
bool isNoble(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}
```

可以忽略掉返回值类型

```dart
isNoble(atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}
```

如果只有一个语句，可使用 `=> *expr*`语法（`{ return *expr*; }`）

```dart
bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;
```



### 参数



































