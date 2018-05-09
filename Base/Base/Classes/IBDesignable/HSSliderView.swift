//
//  HSSliderView.swift
//  iOSTest
//
//  Created by 刘剑云 on 2018/4/27.
//  Copyright © 2018年 clint. All rights reserved.
//

import UIKit

@IBDesignable class HSSliderView: UIView {
    override open var intrinsicContentSize: CGSize {
        return CGSize.init(width: super.intrinsicContentSize.width, height: 25)
    }
    
    private let lineHeight: CGFloat = 12
    
    @IBInspectable var image: UIImage? {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var title: NSString? {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var rate: CGFloat = 0.0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var lightColor: UIColor = UIColor.init(red: 203 / 255.0, green: 48 / 255.0, blue: 47 / 255.0, alpha: 1.0) {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var darkColor: UIColor = UIColor.init(red: 221 / 255.0, green: 231 / 255.0, blue: 243 / 255.0, alpha: 1.0) {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var corner: CGFloat = 6.0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var textPadding: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.layer.contentsScale = UIScreen.main.scale
        
        let context = UIGraphicsGetCurrentContext()
        context?.setAllowsAntialiasing(true)
        context?.setShouldAntialias(true)
        
        var left: CGFloat = 0.0
        
        self.backgroundColor = UIColor.clear
        if image != nil {
            let imageHeight = 17.0 * CGFloat((image?.cgImage?.height)!) / CGFloat((image?.cgImage?.width)!)
            context?.draw((image?.cgImage)!, in: CGRect.init(x: 0, y: rect.size.height / 2 - imageHeight / 2, width: 17, height: imageHeight))
            left += 25
        }
        
        let lineWidth: CGFloat = (title != nil) ? (rect.size.width - left - 50) : (textPadding ? (rect.size.width - left - 50) : (rect.size.width - left))
        let darkPath = UIBezierPath.init(roundedRect: CGRect.init(x: left, y: rect.size.height / 2.0 -  lineHeight / 2.0, width: lineWidth, height: lineHeight), cornerRadius: corner)
        darkColor.setFill()
        darkPath.fill()
        
        let lightPath = UIBezierPath.init(roundedRect: CGRect.init(x: left, y: rect.size.height / 2.0 - lineHeight / 2.0, width: lineWidth * rate, height: lineHeight), cornerRadius: corner)
        lightColor.setFill()
        lightPath.fill()
        
        if title != nil {
            let attribute = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor : UIColor.red]
            let strSize = title?.size(withAttributes: attribute)
            let marginTop = (rect.size.height - (strSize?.height)!) / 2.0
            title?.draw(in: CGRect.init(x: left + lineWidth + 10, y: 0 + marginTop, width: rect.size.width, height: (strSize?.height)!), withAttributes: attribute)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setNeedsDisplay()
    }
   
}
