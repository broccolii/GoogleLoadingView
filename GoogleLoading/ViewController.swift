//
//  ViewController.swift
//  GoogleLoading
//
//  Created by Broccoli on 15/9/10.
//  Copyright (c) 2015年 Broccoli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var comlexLoadingView: UIView!
    @IBOutlet weak var loadingView: UIView!
    
    let ovalShapeLayer: CAShapeLayer = CAShapeLayer()
    let anotherOvalShape: CAShapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        strokeColor：笔画颜色。
        
        strokeStart：笔画开始位置。
        strokeEnd：笔画结束位置。
        
        fillColor：图形填充颜色。
        lineWidth：笔画宽度，即笔画的粗细程度。
        lineDashPattern：虚线模式。
        path：图形的路径。
        lineCap：笔画未闭合位置的形状。
        */
        
        ovalShapeLayer.strokeColor = UIColor.whiteColor().CGColor
        ovalShapeLayer.fillColor = UIColor.clearColor().CGColor
        ovalShapeLayer.lineWidth = 7
        ovalShapeLayer.strokeEnd = 0.4
        ovalShapeLayer.lineCap = kCALineCapRound
        
        let ovalRadius = loadingView.frame.size.height / 2 * 0.8
        ovalShapeLayer.path = UIBezierPath(ovalInRect: CGRect(x: loadingView.frame.width / 2 - ovalRadius, y: loadingView.frame.height / 2 - ovalRadius, width: ovalRadius * 2, height: ovalRadius * 2)).CGPath
        
        loadingView.layer.addSublayer(ovalShapeLayer)
      
        
        anotherOvalShape.strokeColor = UIColor.whiteColor().CGColor
        anotherOvalShape.fillColor = UIColor.clearColor().CGColor
        anotherOvalShape.lineWidth = 7
        anotherOvalShape.strokeEnd = 0.4
        anotherOvalShape.lineCap = kCALineCapRound
        
        let anotherOvalRadius = comlexLoadingView.frame.size.height / 2 * 0.8
        anotherOvalShape.path = UIBezierPath(ovalInRect: CGRect(x: comlexLoadingView.frame.width / 2 - ovalRadius, y: comlexLoadingView.frame.height / 2 - ovalRadius, width: ovalRadius * 2, height: ovalRadius * 2)).CGPath
        
        comlexLoadingView.layer.addSublayer(anotherOvalShape)
    }

    override func viewWillAppear(animated: Bool) {
        beginComplexAnimation()
         beginSimpleAnimation()
    }
    
    func beginSimpleAnimation() {
        
        /*
        transform.rotation：旋转动画。
        transform.ratation.x：按x轴旋转动画。
        transform.ratation.y：按y轴旋转动画。
        transform.ratation.z：按z轴旋转动画。
        transform.scale：按比例放大缩小动画。
        transform.scale.x：在x轴按比例放大缩小动画。
        transform.scale.y：在y轴按比例放大缩小动画。
        transform.scale.z：在z轴按比例放大缩小动画。
        position：移动位置动画。
        opacity：透明度动画
        */
        let rotate = CABasicAnimation(keyPath: "transform.rotation.z")
        rotate.duration = 1.5
        rotate.fromValue = 0
        rotate.toValue = 2 * M_PI
        rotate.repeatCount = HUGE
        loadingView.layer.addAnimation(rotate, forKey: nil)
    }

    
    func beginComplexAnimation() {
        let strokeStartAnimate = CABasicAnimation(keyPath: "strokeStart")
        strokeStartAnimate.fromValue = -0.5
        strokeStartAnimate.toValue = 1
        
        let strokeEndAnimate = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimate.fromValue = 0.0
        strokeEndAnimate.toValue = 1
        
        let strokeAnimateGroup = CAAnimationGroup()
        strokeAnimateGroup.duration = 1.5
        strokeAnimateGroup.repeatCount = HUGE
        strokeAnimateGroup.animations = [strokeStartAnimate, strokeEndAnimate]
        anotherOvalShape.addAnimation(strokeAnimateGroup, forKey: nil)
    }
}

