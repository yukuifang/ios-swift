//
//  Protocol_2.swift
//  Base
//
//  Created by fangyukui on 2018/5/4.
//  Copyright © 2018年 fangyukui. All rights reserved.
//

import Foundation

//协议
/**
1. 为方法、属性、以及其他特定的任务需求或功能定义蓝图。协议可被类、结构体、或枚举类型采纳以提供所需功能的具体实现。满足了协议中需求的任意类型都叫做遵循了该协议。
2. 除了指定遵循类型必须实现的要求外，你可以扩展一个协议以实现其中的一些需求或实现一个符合类型的可以利用的附加功能。

 协议的语法
 
3. 定义协议的方式与类、结构体、枚举类型非常相似：
 protocol SomeProtocol {
 // protocol definition goes here
 }
 
4. 在自定义类型声明时，将协议名放在类型名的冒号之后来表示该类型采纳一个特定的协议。多个协议可以用逗号分开列出：
 struct SomeStructure: FirstProtocol, AnotherProtocol {
 // structure definition goes here
 }
 
5. 若一个类拥有父类，将这个父类名放在其采纳的协议名之前，并用逗号分隔：
 class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
 // class definition goes here
 }
 **/


/**
 属性要求
 协议可以要求所有遵循该协议的类型提供特定名字和类型的 实例属性 或 类型属性static 。协议并不会具体说明属性是储存型属性还是计算型属性——它只具体要求属性有特定的名称和类型。协议同时要求一个属性必须明确是可读的或可读的和可写的。
 若协议要求一个属性为可读和可写的，那么该属性要求不能用常量存储属性或只读计算属性来满足。若协议只要求属性为可读的，那么任何种类的属性都能满足这个要求，而且如果你的代码需要的话，该属性也可以是可写的。
 1。 属性要求定义为变量属性，在名称前面使用 var 关键字。可读写的属性使用 { get set } 来写在声明后面来明确，使用 { get } 来明确可读的属性。
 
 protocol SomeProtocol {
 var mustBeSettable: Int { get set }
 var doesNotNeedToBeSettable: Int { get }
 }
 
 2. 在协议中定义类型属性时在前面添加 static 关键字。当类的实现使用 class 或 static 关键字前缀声明类型属性要求时，这个规则仍然适用：
 protocol AnotherProtocol {
 static var someTypeProperty: Int { get set }
 }
 
**/
//这里是一个只有一个实例属性要求的协议：

protocol FullyNamed {
    var fullName: String { get }
}

//上面 FullyNamed 协议要求遵循的类型提供一个完全符合的名字。这个协议并未指定遵循类型的其他任何性质——它只要求这个属性必须为其自身提供一个全名。协议申明了所有 FullyNamed 类型必须有一个可读实例属性 fullName ，且为 String 类型。
//
//这里是一个采纳并遵循 FullyNamed 协议的结构体的例子：

struct Person: FullyNamed {
    var fullName: String
}

//这个例子定义了一个名为 Person 的结构体，它表示一个有名字的人。它在其第一行定义中表明了它采纳 FullyNamed 协议作为它自身的一部分。
//
//每一个 Person 的实例都有一个名为 fullName 的 String 类型储存属性。这符合了 FullyNamed 协议的单一要求，并且表示 Person 已经正确地遵循了该协议。（若协议的要求没有完全达标，Swift 在编译时会报错。）
//
//这里是一个更加复杂的类，采纳并遵循了 FullyNamed 协议：

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
//这个类为一艘星舰实现了 fullName 计算型只读属性的要求。每一个 Starship 类的实例储存了一个不可选的 name 属性以及一个可选的 prefix 属性。当 prefix 值存在时， fullName 将 prefix 放在 name 之前以创建星舰的全名。

//方法要求

//协议可以要求采纳的类型实现指定的实例方法和类方法。这些方法作为协议定义的一部分，书写方式与正常实例和类方法的方式完全相同，但是不需要大括号和方法的主体。允许变量拥有参数，与正常的方法使用同样的规则。但在协议的定义中，方法参数不能定义默认值。
//
//正如类型属性要求的那样，当协议中定义类型方法时，你总要在其之前添加 static 关键字。即使在类实现时，类型方法要求使用 class 或 static 作为关键字前缀，前面的规则仍然适用：
protocol SomeProtocol {
    static func someTypeMethod()
}

//下面的例子定义了一个只有一个实例方法要求的协议：
protocol RandomNumberGenerator {
    func random() -> Double
}

//这里 RandomNumberGenerator 协议要求所有采用该协议的类型都必须有一个实例方法 random ，而且要返回一个 Double 的值，无论这个值叫什么。尽管协议没有明确定义，这里默认这个值在 0.0  到 1.0 （不包括）之间。
//
//RandomNumberGenerator 协议并不为随机值的生成过程做任何定义，它只要求生成器提供一个生成随机数的标准过程。
//
//这里有一个采用并遵循 RandomNumberGenerator 协议的类的实现。这个类实现了著名的 linear congruential generator 伪随机数发生器算法：


class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

//异变方法要求
//有时一个方法需要改变（或异变）其所属的实例。例如值类型的实例方法（即结构体或枚举），在方法的 func 关键字之前使用 mutating 关键字，来表示在该方法可以改变其所属的实例，以及该实例的所有属性。这一过程写在了在实例方法中修改值类型中。
//
//若你定义了一个协议的实例方法需求，想要异变任何采用了该协议的类型实例，只需在协议里方法的定义当中使用 mutating 关键字。这允许结构体和枚举类型能采用相应协议并满足方法要求。
//注意
//如果你在协议中标记实例方法需求为 mutating ，在为类实现该方法的时候不需要写 mutating 关键字。 mutating 关键字只在结构体和枚举类型中需要书写。

//下面的例子定义了一个名为 Togglable 的协议，协议只定义了一个实例方法要求叫做 toggle 。顾名思义， toggle() 方法将切换或转换任何遵循该协议的类型的状态，典型地，修改该类型的属性。
//
//在Togglable协议的定义中， toggle() 方法使用 mutating 关键字标记，来表明该方法在调用时会改变遵循该协议的实例的状态：

protocol Togglable {
    mutating func toggle()
}
//若使用结构体或枚举实现 Togglable 协议，这个结构体或枚举可以通过使用 mutating 标记这个 toggle() 方法，来保证该实现符合协议要求。
//
//下面的例子定义了一个名为 OnOffSwitch 的枚举。这个枚举在两种状态间改变，即枚举成员 On 和 Off 。该枚举的 toggle 实现使用了 mutating 关键字，以满足 Togglable 协议需求：

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

//初始化器要求
//协议可以要求遵循协议的类型实现指定的初始化器。和一般的初始化器一样，只用将初始化器写在协议的定义当中，只是不用写大括号也就是初始化器的实体：
//protocol SomeProtocol {
//    init(someParameter: Int)
//}


//协议初始化器要求的类实现
//你可以通过实现指定初始化器或便捷初始化器来使遵循该协议的类满足协议的初始化器要求。在这两种情况下，你都必须使用 required 关键字修饰初始化器的实现：


//class SomeClass: SomeProtocol {
//    required init(someParameter: Int) {
//        // initializer implementation goes here
//    }
//}


/**
如果一个子类重写了父类指定的初始化器，并且遵循协议实现了初始化器要求，那么就要为这个初始化器的实现添加 required 和 override 两个修饰符：


protocol SomeProtocol {
    init()
}

class SomeSuperClass {
    init() {
        // initializer implementation goes here
    }
}

class SomeSubClass: SomeSuperClass, SomeProtocol {
    // "required" from SomeProtocol conformance; "override" from SomeSuperClass
    required override init() {
        // initializer implementation goes here
    }
}
 **/

/**
将协议作为类型
实际上协议自身并不实现功能。不过你创建的任意协议都可以变为一个功能完备的类型在代码中使用。

由于它是一个类型，你可以在很多其他类型可以使用的地方使用协议，包括：

在函数、方法或者初始化器里作为形式参数类型或者返回类型；
作为常量、变量或者属性的类型；
作为数组、字典或者其他存储器的元素的类型。
 
 注意
 
 由于协议是类型，要开头大写（比如说 FullyNamed 和 RandomNumberGenerator ）来匹配 Swift 里其他类型名称格式（比如说 Int 、 String 还有 Double ）。
 
 **/











