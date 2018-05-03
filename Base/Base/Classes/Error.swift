//
//  Error.swift
//  Base
//
//  Created by fangyukui on 2018/5/3.
//  Copyright © 2018年 fangyukui. All rights reserved.
//

import Foundation
//你可以用任何遵循 Error 协议的类型来表示错误
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

//使用 throw 来抛出一个错误并且用 throws 来标记一个可以抛出错误的函数。如果你在函数里抛出一个错误，函数会立即返回并且调用函数的代码会处理错误。
func pagePrinter(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }else if printerName == "Never Has Paper" {
        throw PrinterError.outOfPaper
    }else if printerName == "Never Has Fire" {
        throw PrinterError.onFire
    }
    return "Job sent"
}

func foo() {
    defer {
        print("finally")
    }
    do {
        print("impossible")
        throw NSError()
    } catch {
        print("handle error")
    }
}



