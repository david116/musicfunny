//
//  StaveView.swift
//  MusicFunny
//
//  Created by ihefe039 on 16/6/7.
//  Copyright © 2016年 leelei. All rights reserved.
//

import UIKit

class StaveView: UIView {
    // 谱表线条粗细
    let lineWidth: CGFloat = 1
    // 音符在X坐标的位置，偏移量
    let noteX: CGFloat = 100
    
    // 谱号
    @IBInspectable
    var clef: StaveExpression.Clef = .Treble { didSet { setNeedsDisplay() } }
    
    // 音符的位置 （总共29个位置，从上往下）
    @IBInspectable
    var position: Int = 1 { didSet { setNeedsDisplay() } }
    
    // 升降音
    @IBInspectable
    var ad: StaveExpression.Ad = .Normal { didSet { setNeedsDisplay() } }
    
    // 节拍时值
    @IBInspectable
    var beat: StaveExpression.Beat = .Whole { didSet { setNeedsDisplay() } }
    
    override func drawRect(rect: CGRect) {
        let context:CGContextRef =  UIGraphicsGetCurrentContext()!//获取画笔上下文
        
        CGContextSetAllowsAntialiasing(context, true) //抗锯齿设置
        
        //根据矩形区域画椭圆
        //CGContextFillEllipseInRect(context, CGRectMake(75, 75, 50, 50))
        
        CGContextSetLineWidth(context, 1) //设置画笔宽度
    
        // 1）画线
        CGContextMoveToPoint(context, 10, 20)
        CGContextAddLineToPoint(context, 280, 20)
        
        CGContextMoveToPoint(context, 10, 38)
        CGContextAddLineToPoint(context, 280, 38)
        
        CGContextMoveToPoint(context, 10, 56)
        CGContextAddLineToPoint(context, 280, 56)
        
        CGContextMoveToPoint(context, 10, 74)
        CGContextAddLineToPoint(context, 280, 74)
        
        CGContextMoveToPoint(context, 10, 92)
        CGContextAddLineToPoint(context, 280, 92)
        
        CGContextMoveToPoint(context, 60, 110)
        CGContextAddLineToPoint(context, 100, 110)
        
        CGContextStrokePath(context)
        
        // 2)画谱号
        switch clef {
        case .Treble:
            let img:UIImage = UIImage(named: "treble1")!
            img.drawAtPoint(CGPointMake(6, 0))
        case .Bass:
            let img:UIImage = UIImage(named: "bass")!
            img.drawAtPoint(CGPointMake(6, 18))
        default:
            break
        }
        
        // 3) 画音符
        
        
        // 
        CGContextStrokePath(context)//关闭路径
    }
    
    
    
}