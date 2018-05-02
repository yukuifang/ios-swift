//
//  classTests.swift
//  BaseTests
//
//  Created by fangyukui on 2018/5/2.
//  Copyright © 2018年 fangyukui. All rights reserved.
//

import XCTest
@testable import Base

class ClassTests: XCTestCase {
    func testClass() {
        print("===================================")
        let test = Square(sideLength: 5.2, name: "my test square")
        print(test.area())
        print(test.simpleDescription())
        print("===================================")
        
    }
    
    
    
}
