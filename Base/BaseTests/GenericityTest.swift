//
//  GenericityTest.swift
//  BaseTests
//
//  Created by fangyukui on 2018/5/3.
//  Copyright © 2018年 fangyukui. All rights reserved.
//

import XCTest
@testable import Base
class GenericityTest: XCTestCase {
    
    func testGenericity()  {
       print("===================================")
       let array = makeArray(repeating: "hello", numberOfTimes: 6)
       print(array)
        
        
        var possibleInteger: OptionalValue<Int> = .none
        print(possibleInteger)
        possibleInteger = .some(100)
        print(possibleInteger)
        
        anyCommonElements([1, 2, 3], [3])
        
        
       print("===================================")
    }
}
