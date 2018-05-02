//
//  Method.swift
//  Base
//
//  Created by fangyukui on 2018/5/2.
//  Copyright © 2018年 fangyukui. All rights reserved.
//

import Foundation

//函数
//1.1 使用 func来声明一个函数。通过在名字之后在圆括号内添加一系列参数来调用这个方法。使用 ->来分隔形式参数名字类型和函数返回的类型。
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}

//1.2 默认情况下，函数使用他们的形式参数名来作为实际参数标签。在形式参数前可以写自定义的实际参数标签，或者使用 _ 来避免使用实际参数标签。

func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}

//1.3 使用元组来创建复合值——比如，为了从函数中返回多个值。元组中的元素可以通过名字或者数字调用。

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}

//1.4 函数同样可以接受多个参数，然后把它们存放进数组当中。
func sumOf(numbers:Int...) -> Int{
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
//1.5 函数可以内嵌。内嵌的函数可以访问外部函数里的变量。你可以通过使用内嵌函数来组织代码，以避免某个函数太长或者太过复杂。

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}

//1.6 函数是一等类型，这意味着函数可以把函数作为值来返回。
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
//1.7 函数也可以把另外一个函数作为其自身的参数。
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> [Int] {
    var suits = [Int]()
    for item in list {
        if condition(item) {
            suits.append(item)
        }
    }
    return suits
}
//1.8 函数其实就是闭包的一种特殊形式：一段可以被随后调用的代码块。闭包中的代码可以访问其生效范围内的变量和函数，就算是闭包在它声明的范围之外被执行——你已经在内嵌函数的栗子上感受过了。你可以使用花括号（ {}）括起一个没有名字的闭包。在闭包中使用 in来分隔实际参数和返回类型。

func mapNumbers(){
    let numbers = [1,5,2,8]
//    let result  = numbers.map { (number:Int) -> Int in
//        return number * 3
//    }
    
    let result = numbers.map { $0 * 4 }
    print(result)

}

func sortedNumbers(){
    let numbers = [1,5,2,8]
    let result = numbers.sorted{$0 > $1}
    print(result)
}










