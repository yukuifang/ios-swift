//
//  ViewController.swift
//  Base
//
//  Created by fangyukui on 2018/5/2.
//  Copyright © 2018年 fangyukui. All rights reserved.
//

import UIKit

@IBDesignable
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let v =  BezierView(frame: CGRect(x: 20, y: 20, width: 300, height: 30))
        
        v.layer.cornerRadius = 10.0;
        
        v.layer.masksToBounds = true
        
        v.backgroundColor = .blue
        
        view.addSubview(v)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

