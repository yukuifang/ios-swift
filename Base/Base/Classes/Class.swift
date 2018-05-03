//
//  class.swift
//  Base
//
//  Created by fangyukui on 2018/5/2.
//  Copyright © 2018年 fangyukui. All rights reserved.
//

import Foundation

//对象和类

//通过在 class后接类名称来创建一个类。在类里边声明属性与声明常量或者变量的方法是相同的，唯一的区别的它们在类环境下。同样的，方法和函数的声明也是相同的写法。

//注意使用 self来区分 name属性还是初始化器里的 name参数。创建类实例的时候给初始化器传参就好像是调用方法一样。每一个属性都需要赋值——要么在声明的时候（比如说 numberOfSides），要么就要在初始化器里赋值（比如说 name）。
//使用 deinit来创建一个反初始化器，如果你需要在释放对象之前执行一些清理工作的话。
//
//声明子类就在它名字后面跟上父类的名字，用冒号分隔。创建类不需要从什么标准根类来继承，所以你可以按需包含或者去掉父类声明。
//
//子类的方法如果要重写父类的实现，则需要使用 override——不使用 override关键字来标记则会导致编译器报错。编译器同样也会检测使用 override的方法是否存在于父类当中。

class NamedShape {
    //存储属性
    var numberOfSides: Int = 0
    var name: String
    init(name: String) {
        self.name = name
    }
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    func area() ->  Double {
        return sideLength * sideLength
    }
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
//    1.设定子类声明的属性的值；
//    2.调用父类的初始化器；
//    3.改变父类定义的属性中的值，以及其他任何使用方法，getter 或者 setter 等需要在这时候完成的内容。
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
//    getter 和 setter 的计算属性
//    新值被隐式地命名为 newValue。你可以提供一个显式的名字放在 set 后边的圆括号里。
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

class TriangleAndSquare {
//    如果你不需要计算属性但仍然需要在设置一个新值的前后执行代码，使用 willSet和 didSet。比如说，下面的类确保三角形的边长始终和正方形的边长相同。
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}


