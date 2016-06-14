//
//  StaveView.swift
//  MusicFunny
//
//  Created by leelei on 16/6/7.
//  Copyright © 2016年 leelei. All rights reserved.
//

import UIKit

class StaveView: UIView {
    // 谱表线条粗细
    let lineWidth: CGFloat = 2
    // 音符在X坐标的位置，偏移量
    //let noteX: CGFloat = 160
    // 绘制音符的宽度和长度
    let noteWidth: CGFloat = 20
    let noteHeight: CGFloat = 18
    // 设置五线谱线条绘制参数
    let add_len:CGFloat = 50        // 增加线长度
    let interval:CGFloat = 18       // 每条线间隔
    
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
        
        // 0）准备 ， 将五线谱线条根据屏幕尺寸 放置到水平中央
        let base_y:CGFloat = 20                          // 距离顶部坐标偏移
        let base_len:CGFloat = 300                       // 基础中间五线长度
        let base_x = (bounds.size.width - base_len) / 2  // 距离左边界标准坐标偏移
        //print ("basex: \(base_x), width = \(bounds.size.width)")
        let top_x = base_x + base_len / 2                // 顶部增加线 距离左边界坐标偏移
        let bottom_x = base_x + base_len / 2             // 顶部增加线 距离左边界坐标偏移
        
        // 音符在X坐标的位置，偏移量
        let noteX: CGFloat = base_x + base_len / 2 + 10
        
        let context:CGContextRef =  UIGraphicsGetCurrentContext()!  //获取画笔上下文
        CGContextSetAllowsAntialiasing(context, true)               //抗锯齿设置
        CGContextSetLineWidth(context, 1)                           //设置画笔宽度
        
        
        // 1）画线
        // 上加5线
        var sn:CGFloat = 0
        for i in 3..<5 {            // 暂时遮住 上面3条线
            sn = CGFloat(i)
            CGContextMoveToPoint(context, top_x, base_y + interval * sn)
            CGContextAddLineToPoint(context, top_x + add_len, base_y + interval * sn)
        }
        
        // 标准五线谱的五条线
        //var sn:CGFloat = 0
        for i in 0..<5 {
            sn = CGFloat(i + 5)
            CGContextMoveToPoint(context, base_x, base_y + interval * sn)
            CGContextAddLineToPoint(context, base_x + base_len, base_y + interval * sn)
            
        }
        
        // 绘制下加五线
        for i in 0..<2 {            // 暂时遮住下面3条线
            sn = CGFloat(i+10)
            CGContextMoveToPoint(context, bottom_x, base_y + interval * sn)
            CGContextAddLineToPoint(context, bottom_x + add_len, base_y + interval * sn)
        }
        
        // 2)画谱号
        switch clef {
        case .Treble:
            let img:UIImage = UIImage(named: "treble1")!
            img.drawAtPoint(CGPointMake(base_x, 5*interval))
        case .Bass:
            let img:UIImage = UIImage(named: "bass")!
            img.drawAtPoint(CGPointMake(base_x, 6*interval))
        default:
            break
        }
        
        // 3) 画音符
        // print("pos: \(position)")
        // 线条以从上到下（Y轴）按 1 - 15，每条间隔 interval 绘制，但是音符位置不止在线上，还有线间(Blank_X)
        // 音符以围绕矩形的椭圆来设置，四个参数，分别为起点X,Y，以及长宽，因此音符逐渐跳跃的步长为 0.5 interval
        let startY: CGFloat = base_y + CGFloat(position-2)*interval/2
        // origianl x,y, width , height1
        CGContextAddEllipseInRect(context, CGRectMake(noteX, startY, noteWidth, noteHeight))
        
        //CGContextAddEllipseInRect(context, CGRectMake(80, 20, noteWidth, noteHeight))
        
        
        //
        CGContextStrokePath(context)//关闭路径
    }
}