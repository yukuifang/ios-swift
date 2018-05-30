//
//  BezierPath.swift
//  Base
//
//  Created by fangyukui on 2018/5/10.
//  Copyright © 2018年 fangyukui. All rights reserved.
//

import UIKit

class BezierView: UIView {
    override func draw(_ rect: CGRect) {
//        let react = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: 10, height: bounds.size.height)
//
//        let pathRect = UIEdgeInsetsInsetRect(react, UIEdgeInsetsMake(1, 1, 1, 1))
//
//        let path = UIBezierPath(roundedRect: pathRect, cornerRadius: 10)
//
//
//        path.lineWidth = 1
//
//        UIColor.green.setFill()
//
//        UIColor.black.setStroke()
//
//        path.fill()
//
//        path.stroke()
        
        let react = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: 10, height: bounds.size.height)
        
        let pathRect = UIEdgeInsetsInsetRect(react, UIEdgeInsetsMake(4,4,4, 4))
        
        let path = UIBezierPath(roundedRect: pathRect, cornerRadius: 10)
        
        let sLayer = CAShapeLayer()
        
        sLayer.path = path.cgPath
        
        sLayer.fillColor = UIColor.red.cgColor
        
        layer.addSublayer(sLayer)
        
        
    }
}
