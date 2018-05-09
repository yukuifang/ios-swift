//
//  HSFootView.swift
//  iOSTest
//
//  Created by 刘剑云 on 2018/4/27.
//  Copyright © 2018年 clint. All rights reserved.
//

import UIKit

@IBDesignable class HSFootView: UIView {
    
    @IBOutlet var widthConstrain: NSLayoutConstraint!

    @IBOutlet var trailConstrain: NSLayoutConstraint!

    @IBInspectable var stopEnable: Bool = true {
        didSet {
            widthConstrain.isActive = !stopEnable
            trailConstrain.isActive = stopEnable
        }
    }

    override open var intrinsicContentSize: CGSize {
        return CGSize.init(width: super.intrinsicContentSize.width, height: 64)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadViewFromNib()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadViewFromNib()
    }

    @IBAction func btnClick(_ sender: UIButton) {
        print("click")
    }
    func loadViewFromNib() {
        let className = type(of: self)
        let contentView = Bundle.init(for: className).loadNibNamed(String.init(describing: className), owner: self, options: nil)?.first as! UIView
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(contentView)
    }

    
}

