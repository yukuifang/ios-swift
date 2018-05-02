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
        let shape = Shape()
        shape.numberOfSides = 7
        print(shape.simpleDescription())
        
    }
    
    
    
}
