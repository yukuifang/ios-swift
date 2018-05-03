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
        
        let test1 = EquilateralTriangle(sideLength: 4, name: "my test equilateralTriangle")
        test1.perimeter = 30
        print(test1.simpleDescription())
        
        let triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
        print(triangleAndSquare.square.sideLength)
        print(triangleAndSquare.triangle.sideLength)
        triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
        print(triangleAndSquare.triangle.sideLength)
        
        print("===================================")
        
    }
    
    
    
}
