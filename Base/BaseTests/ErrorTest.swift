//
//  ErrorTest.swift
//  BaseTests
//
//  Created by fangyukui on 2018/5/3.
//  Copyright © 2018年 fangyukui. All rights reserved.
//

import XCTest
@testable import Base
class ErrorTest: XCTestCase {
    
    func testError()  {
        //有好几种方法来处理错误。一种是使用 do-catch 。在 do 代码块里，你用 try 来在能抛出错误的函数前标记。在 catch 代码块，错误会自动赋予名字 error ，如果你不给定其他名字的话
        print("===================================")
        do {
            let printerResponse = try pagePrinter(job: 1040, toPrinter: "Never Has Toner")
            print(printerResponse)
        } catch PrinterError.onFire {
            print("I'll just put this over here, with the rest of the fire.")
        } catch let printerError as PrinterError {
            print("Printer error: \(printerError).")
        } catch {
            print(error)
        }
        
        
//        另一种处理错误的方法是使用 try? 来转换结果为可选项。如果函数抛出了错误，那么错误被忽略并且结果为 nil 。否则，结果是一个包含了函数返回值的可选项。
        let printerSuccess = try? pagePrinter(job: 1884, toPrinter: "Mergenthaler")
        print(printerSuccess ?? "除非异常了，否则空空如也")
        
        let printerFailure = try? pagePrinter(job: 1885, toPrinter: "Never Has Toner")
        print(printerFailure ?? "异常了")
        
        
        
        foo()
        print("===================================")
        
        
        
    }
    
}
