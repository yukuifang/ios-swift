//
//  EnumStructTest.swift
//  BaseTests
//
//  Created by fangyukui on 2018/5/3.
//  Copyright © 2018年 fangyukui. All rights reserved.
//

import XCTest
@testable import Base

class EnumStructTest: XCTestCase {
    func testEnumStruct(){
       print("===================================")
       let rank = Rank.king
       print(rank.rawValue)
        
//        默认情况下，Swift 从零开始给原始值赋值后边递增，但你可以通过指定特定的值来改变这一行为。在上边的栗子当中，原始值的枚举类型是 Int，所以你只需要确定第一个原始值。剩下的原始值是按照顺序指定的。你同样可以使用字符串或者浮点数作为枚举的原始值。使用 rawValue 属性来访问枚举成员的原始值。
//
//        使用 init?(rawValue:) 初始化器来从一个原始值创建枚举的实例。
        //默认构造器
       if let convertedRank = Rank(rawValue: 11) {
          let threeDescription = convertedRank.simpleDescription()
          print(threeDescription)
        
       }
        
       
        let hearts = Suit.hearts
        print(hearts.simpleDescription())
        print(hearts.color())
        
        
        let responseData:(startTime:String,endTime:String)? = ("6:00 am","8:09 pm")
        var res:ServerResponse
        if let responseData = responseData{
            res = ServerResponse.result(responseData.startTime,responseData.endTime)
        }else{
            res = ServerResponse.failure("Out of cheese.")
        }
        
        switch res {
            case let .result(sunrise, sunset):
                print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
            case let .failure(message):
                print("Failure...  \(message)")
        }
        
        
        
        let threeOfSpades = Card(rank: .three, suit: .spades)
        print(threeOfSpades.simpleDescription())
        
       print("===================================")
    }
    
}
