//
//  HigherOrderFunctionTests.swift
//  BaseTests
//
//  Created by fangyukui on 2018/5/9.
//  Copyright © 2018年 fangyukui. All rights reserved.
//

import XCTest

class HigherOrderFunctionTests: XCTestCase {
    
    func testExample()  {
        print("===================================")
       // $0代表数组中的每一个元素
        let stringArray = ["Objective-C", "Swift", "HTML", "CSS", "JavaScript"]
        let newArray = stringArray.map { $0.count }
        print(newArray)
        
//        latMap与map不同之处：flatMap返回后的数组中不存在nil，同时它会把Optional解包
        
        let fruits  = ["Apple", "Orange", "Puple", ""]
        let mapCountFruits = fruits.map{ $0.count != 0 ? $0.count :  nil }
        print(mapCountFruits)
        let flatMapCountFruits = fruits.flatMap{ $0.count != 0 ? $0.count :  nil }
        print(flatMapCountFruits)
        
//        flatMap还能把数组中存有数组的数组（二维数组、N维数组）一同打开变成一个新的数组
        let nums = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
        print(nums.map{ $0 })
        print(nums.flatMap{ $0 })
        
        
        //filter 过滤，可以对数组中的元素按照某种规则进行一次过滤
        let filterArray =  stringArray.filter{ $0.count < 10 }
        print(filterArray)
        
        //reduce "" 第一个参数是初始值, $0表示计算后的结果, $1表示数组中的每一个元素
        let reduceArray =  stringArray.reduce("", {
            return $0 == "" ? $1 : $0 + "、" + $1
        })
        print(reduceArray)
        
        
        
        
        
        
        
        
        
        print("===================================")
    }
    
}
