//
//  Genericity.swift
//  Base
//
//  Created by fangyukui on 2018/5/3.
//  Copyright © 2018年 fangyukui. All rights reserved.
//

import Foundation

//把名字写在尖括号里来创建一个泛型方法或者类型

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

//你可以从函数和方法同时还有类，枚举以及结构体创建泛型。
// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

//在类型名称后紧接 where来明确一系列需求——比如说，来要求类型实现一个协议，要求两个类型必须相同，或者要求类必须继承自特定的父类。
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

