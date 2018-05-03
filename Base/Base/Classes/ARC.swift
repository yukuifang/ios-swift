//
//  ARC.swift
//  Base
//
//  Created by fangyukui on 2018/5/3.
//  Copyright © 2018年 fangyukui. All rights reserved.
//

import Foundation

class HTMLElement {
    let name: String
    let text: String?
    lazy var asHTML: () -> String = { [unowned self]  in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
        
    }
    deinit {
        print("\(name) is being deinitialized")
    }
    
}
