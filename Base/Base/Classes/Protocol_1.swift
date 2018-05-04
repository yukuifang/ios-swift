//
//  Protocol.swift
//  Base
//
//  Created by fangyukui on 2018/5/3.
//  Copyright © 2018年 fangyukui. All rights reserved.
//

import Foundation

protocol ExampleProtocol {
    var simpleDescription: String { get }
//   mutating修饰的意义就是能使  类，枚举以及结构体都兼容协议
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
//注意使用 mutating关键字来声明在 SimpleStructure中使方法可以修改结构体属性。在 SimpleClass中则不需要这样声明，因为类里的方法总是可以修改其自身属性的。
struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

//使用 extension来给现存的类型增加功能，比如说新的方法和计算属性。你可以使用扩展来使协议来别处定义的类型，或者你导入的其他库或框架。
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self *= 2
    }
}


