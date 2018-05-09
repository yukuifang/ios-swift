//
//  MyImage.swift
//  Base
//
//  Created by fangyukui on 2018/5/9.
//  Copyright © 2018年 fangyukui. All rights reserved.
//

import UIKit

@IBDesignable class MyImage: UIView {
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadViewFromNib()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadViewFromNib()
    }
    
   
    func loadViewFromNib() {
        let className = type(of: self)
        let contentView = Bundle.init(for: className).loadNibNamed(String.init(describing: className), owner: self, options: nil)?.first as! UIView
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(contentView)
    }
    
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        let className = type(of: self)
//        let view  =  Bundle(for: self.classForCoder).loadNibNamed(String.init(describing: className), owner: self, options: nil)?.first as! UIView
//        addSubview(view)
//    }
//    override func draw(_ rect: CGRect) {
//        let className = type(of: self)
//        let view  =  Bundle(for: self.classForCoder).loadNibNamed(String.init(describing: className), owner: self, options: nil)?.first as! UIView
//        addSubview(view)
//    }
    
    

}
