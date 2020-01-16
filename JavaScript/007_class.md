# class

参考:

+ [Class 的基本语法](<http://es6.ruanyifeng.com/#docs/class>)

以前生成实例对象是通过使用构造函数

```javascript
var SpaceShuttle = function(targetPlanet){
  this.targetPlanet = targetPlanet;
}
var zeus = new SpaceShuttle('Jupiter');
```

在es6中，通过class定义类，上面的构造函数等同于下面的代码：

```javascript
class SpaceShuttle {
  constructor(targetPlanet){
    this.targetPlanet = targetPlanet;
  }
}
const zeus = new SpaceShuttle('Jupiter');
```

+ `constructor`方法表示构造方法，`this`关键字表示实例对象



> 定义“类”的方法的时候，前面不需要加上`function`这个关键字，直接把函数定义放进去了就可以了
>
> ```javascript
> class Point {
>   constructor(x, y) {
>     this.x = x;
>     this.y = y;
>   }
> 
>   toString() {
>     return '(' + this.x + ', ' + this.y + ')';
>   }
> }
> ```



## 取值函数（getter）和存值函数（setter）

使用`set`和`get`关键字，对某个属性设置存值函数和取值函数，拦截该属性的存取行为

```javascript
class MyClass {
  constructor() {
    // ...
  }
  get prop() {
    return 'getter';
  }
  set prop(value) {
    console.log('setter: '+value);
  }
}

let inst = new MyClass();

inst.prop = 123;
// setter: 123

inst.prop
// 'getter'
```



## 属性表达式

> 类的属性名，可以采用表达式

```javascript
let methodName = 'getArea';

class Square {
  constructor(length) {
    // ...
  }

  [methodName]() {
    // ...
  }
}
```

> 上面代码中，`Square`类的方法名`getArea`，是从表达式得到的。

























