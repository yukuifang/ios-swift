//
//  BaseTests.swift
//  BaseTests
//
//  Created by fangyukui on 2018/5/2.
//  Copyright © 2018年 fangyukui. All rights reserved.
//

import XCTest
@testable import Base


class MethodTests: XCTestCase {
    func testMethod() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        print("===================================")
        _ = greet(person: "Bob", day: "Tuesday")
        _ = greet("John", on: "Wednesday")
        
        let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
        print(statistics.min,statistics.max,statistics.sum)
        print(statistics.0,statistics.1,statistics.2)
        
        let sum = sumOf(numbers: 1,5,8)
        print(sum)
        
        let fifteen = returnFifteen()
        print(fifteen)
        
        let increment = makeIncrementer()
        print(increment(7))
        
        func lessThanTen(number: Int) -> Bool {
            return number < 10
        }
        let numbers = [20, 1, 7, 12]
        print(hasAnyMatches(list: numbers, condition: lessThanTen))
        
        mapNumbers()
        sortedNumbers()
        
        print("===================================")
    
    }
    
    
    
}
