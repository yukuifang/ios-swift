//
//  MyView.swift
//  Base
//
//  Created by fangyukui on 2018/5/9.
//  Copyright © 2018年 fangyukui. All rights reserved.
//

import UIKit

@IBDesignable class MyView: UIView {
   @IBInspectable var cornerRadius:CGFloat = 0.0{
        didSet{
            layer.cornerRadius=cornerRadius
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable var bgColor:UIColor = UIColor.white {
        didSet{
            backgroundColor = bgColor
            let imgV = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            imgV.backgroundColor = .blue
            imgV.image = UIImage(named: "1.jpg", in: Bundle(for: self.classForCoder), compatibleWith: nil)
            addSubview(imgV)
            
        }
    }
    override func awakeFromNib() {
        print("88")
        
    }
    

}
