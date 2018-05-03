//
//  ProtocolTest.swift
//  BaseTests
//
//  Created by fangyukui on 2018/5/3.
//  Copyright © 2018年 fangyukui. All rights reserved.
//

import XCTest
@testable import Base
class ProtocolTest: XCTestCase {
    
    func testProtocol() {
        print("===================================")
        let a = SimpleClass()
        a.adjust()
        print(a.simpleDescription)
        
        var b = SimpleStructure()
        b.adjust()
        print(b.simpleDescription)
        
        var num = 7
        print(num.simpleDescription)
        num.adjust()
        print(num.simpleDescription)
        
        
//        你可以使用协议名称就像其他命名类型一样——比如说，创建一个拥有不同类型但是都遵循同一个协议的对象的集合。当你操作类型是协议类型的值的时候，协议外定义的方法是不可用的。
        
//        尽管变量 protocolValue有 SimpleClass的运行时类型，但编译器还是把它看做 ExampleProtocol。这意味着你不能访问类在这个协议中扩展的方法或者属性。
        
        let protocolValue: ExampleProtocol = a
        print(protocolValue.simpleDescription)
//        print(protocolValue.anotherProperty) // Uncomment to see the error
       

        print("===================================")
        
    }
    
}
