//
//  ARCTest.swift
//  BaseTests
//
//  Created by fangyukui on 2018/5/3.
//  Copyright © 2018年 fangyukui. All rights reserved.
//

import XCTest
@testable import Base
class ARCTest: XCTestCase {
    
    func testARC() {
        print("===================================")
        let heading = HTMLElement(name: "h1")
        let defaultText = "some default text"
//        尽管闭包多次引用了 self ，它只捕获 HTMLElement 实例的一个强引用
        heading.asHTML = {
            return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
        }
        print(heading.asHTML())
        
        
        
        var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
        print(paragraph!.asHTML())
//       闭包必须包含 [unowned self]
        paragraph = nil
        
        print("===================================")
    }
    
}
