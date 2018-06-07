//
//  ViewController.swift
//  LayoutLearn
//
//  Created by fangyukui on 2018/6/7.
//  Copyright © 2018年 fangyukui. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var sizeConstraint:Constraint?
    
    var topConstraint:Constraint?
    
    lazy var remakeConsBtn = UIButton()
    
    lazy var priorityView = UIView()
    
    var scacle = 1.0
    
    lazy var box = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       section2_4()
        
    }

    
}

extension ViewController{
    //更新约束
    func section2_4(){
        priorityView.backgroundColor = .orange
        view.addSubview(priorityView)
        let t = UITapGestureRecognizer(target: self, action: #selector(tap(a:)))
        priorityView.addGestureRecognizer(t)
        
        priorityView.snp.makeConstraints { (make) in
            //视图居中
            make.center.equalToSuperview()
            //初始宽、高为100（优先级低）
            make.width.height.equalTo(100 * self.scacle).priority(100)
            //最大尺寸不能超过屏幕
            make.width.height.lessThanOrEqualTo(view.snp.width)
        }
        
    }
    @objc func tap(a:UITapGestureRecognizer){
        self.scacle += 0.5
        priorityView.snp.updateConstraints{ (make) -> Void in
            //放大视图（优先级最低）
            make.width.height.equalTo(100 * self.scacle).priority(100)
        }
    }
}


extension ViewController{
    //更新约束
    func section2_3(){
        remakeConsBtn.backgroundColor = .orange
        view.addSubview(remakeConsBtn)
        remakeConsBtn.addTarget(self, action: #selector(remakeTap), for: .touchUpInside)
        
        remakeConsBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.top.equalTo(0)
            make.centerX.equalToSuperview()
            
        }
        
    }
    @objc func remakeTap(){
        remakeConsBtn.snp.remakeConstraints { (make) in
            make.width.height.equalTo(200)
        }
    }
}

extension ViewController{
    // 删除约束
    func section2_0(){
        let orangeView = UIView()
        orangeView.backgroundColor = .orange
        view.addSubview(orangeView)
        
        orangeView.snp.makeConstraints { (make) in
            sizeConstraint =  make.width.height.equalTo(100).constraint
            make.center.equalToSuperview()
            
        }
        
    }
    //更新约束
    func section2_1(){
        let orangeView = UIView()
        orangeView.backgroundColor = .orange
        view.addSubview(orangeView)
        
        orangeView.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            topConstraint =  make.top.equalTo(100).constraint
            make.centerX.equalToSuperview()
            
        }
        
    }
    //更新约束
    func section2_2(){
        let orangeView = UIView()
        orangeView.backgroundColor = .orange
        view.addSubview(orangeView)
        box = orangeView
        
        orangeView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(200)
            make.top.equalTo(0)
            make.centerX.equalToSuperview()
            
        }
    }
    
    
//    override func updateViewConstraints() {
//        box.snp.updateConstraints { (make) in
//            make.width.equalToSuperview()
//        }
//        super.updateViewConstraints()
//    }
//
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if (sizeConstraint?.isActive)!{
//            sizeConstraint?.deactivate()
//        }else{
//            sizeConstraint?.activate()
//        }
        
//        topConstraint?.update(offset: 200)
        
        
    }
}


//基本操作
extension ViewController{
    func test0() {
        let testView = UIView()
        testView.backgroundColor = .cyan
        view.addSubview(testView)
        testView.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.center.equalToSuperview()
        }
    }
    func test1() {
        let outView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        outView.backgroundColor = .blue
        outView.center = view.center
        view.addSubview(outView)
        
        let innerView = UIView()
        innerView.backgroundColor = .red
        outView.addSubview(innerView)
        innerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsetsMake(20, 20, 20, 20))
        }
        
    }
    /**
     left、right、top、centerX、centerY等其他属性
     这些属性直接设置常量值，表示他们相对于父容器的相对约束条件。比如我们将绿色方块放置橙色方块内部的右下角位置
     **/
    func test2() {
        let outView = UIView()
        outView.backgroundColor = .blue
        view.addSubview(outView)
        let innerView = UIView()
        innerView.backgroundColor = .red
        outView.addSubview(innerView)
        
        outView.snp.makeConstraints { (make) in
            make.width.height.equalTo(200)
            make.centerY.equalToSuperview()
        }
        innerView.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.bottom.right.equalToSuperview()
        }
        
    }
    
    func test3() {
        let blueView = UIView()
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        let orangeView = UIView()
        orangeView.backgroundColor = .orange
        view.addSubview(orangeView)
        
        blueView.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.top.equalTo(100)
        }
        
        orangeView.snp.makeConstraints { (make) in
            make.height.equalTo(blueView)
            make.left.right.equalTo(blueView)
            make.top.equalTo(blueView.snp.bottom)
        
        }
        
    }
    
    func test4() {
        let blueView = UIView()
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        let orangeView = UIView()
        orangeView.backgroundColor = .orange
        view.addSubview(orangeView)
        
        blueView.snp.makeConstraints { (make) in
            make.height.width.equalTo(200)
            make.center.equalToSuperview()
        }
        orangeView.snp.makeConstraints { (make) in
            make.edges.equalTo(blueView)
            
        }
        
    }
    func test5() {
        let blueView = UIView()
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        let orangeView = UIView()
        orangeView.backgroundColor = .orange
        view.addSubview(orangeView)
        
        blueView.snp.makeConstraints { (make) in
            make.height.width.equalTo(100)
            make.center.equalToSuperview()
        }
        orangeView.snp.makeConstraints { (make) in
            make.left.right.equalTo(blueView)
            make.top.equalTo(blueView.snp.bottom)
            make.size.greaterThanOrEqualTo(blueView)
            
        }
        
    }
    //内位移修正：inset
    func test6() {
        let blueView = UIView()
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        let orangeView = UIView()
        orangeView.backgroundColor = .orange
        blueView.addSubview(orangeView)
        
        blueView.snp.makeConstraints { (make) in
            make.height.width.equalTo(300)
            make.center.equalToSuperview()
        }
        orangeView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsetsMake(15, 10, 20, 30))
        }
    }
    
    //外位移修正：offset
    func test7() {
        let blueView = UIView()
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        let orangeView = UIView()
        orangeView.backgroundColor = .orange
        blueView.addSubview(orangeView)
        
        blueView.snp.makeConstraints { (make) in
            make.height.width.equalTo(300)
            make.center.equalToSuperview()
        }
        orangeView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalToSuperview().offset(-15)
        }
    }
    //倍率修正：multipliedBy
    func test8() {
        let blueView = UIView()
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        let orangeView = UIView()
        orangeView.backgroundColor = .orange
        blueView.addSubview(orangeView)
        
        blueView.snp.makeConstraints { (make) in
            make.height.width.equalTo(300)
            make.center.equalToSuperview()
        }
        orangeView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalToSuperview().multipliedBy(0.5)
        }
    }
    
    
    
    
    
}

