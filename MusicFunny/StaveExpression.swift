//
//  StaveExpression.swift
//  MusicFunny
//
//  Created by leelei on 16/6/8.
//  Copyright © 2016年 leelei. All rights reserved.
//

import Foundation

struct StaveExpression {
    
    enum Clef:Int {
        case Treble = 0 // 高音谱号 G谱号
        case Bass       // 低音谱号 F谱号
        case Alto       // 中音谱号 C谱号
        case Other      // 保留给 次低音 杯低音 以及谱号在不同位置等其他方式
    }
    
    enum Position: Int{ // 音符画在哪条线，或者哪个间
        case Top_Line_5 = 1     // 上加五线
        case Top_Blank_5
        case Top_Line_4
        case Top_Blank_4
        case Top_Line_3
        case Top_Blank_3
        case Top_Line_2
        case Top_Blank_2
        case Top_Line_1
        case Top_Blank_1
        
        case Base_Line_5        // 第五线
        case Base_Blank_4
        case Base_Line_4
        case Base_Blank_3
        case Base_Line_3
        case Base_Blank_2
        case Base_Line_2
        case Base_Blank_1
        case Base_Line_1
        
        case Bottom_Blank_1     // 下加一间
        case Bottom_Line_1      // 下加一线
        case Bottom_Blank_2
        case Bottom_Line_2
        case Bottom_Blank_3
        case Bottom_Line_3
        case Bottom_Blank_4         
        case Bottom_Line_4          
        case Bottom_Blank_5         
        case Bottom_Line_5
    
    }
    
    enum Note:String { // 音符 C D E F G A B
        case C_Do = "C"      // C
        case D_Re = "D"
        case E_Mi = "E"
        case F_Fa = "F"
        case G_So = "G"
        case A_La = "A"
        case B_Xi = "B"
    }
    
    enum Ad:Int {
        case Ascending      // 升音
        case Descending     // 降音
        case Normal         // 无升降
    }
    
    enum Beat:Int {     // 音符时值
        case Whole              // 全音符
        case Half               // 二分音符
        case Quarter            // 四分音符
        case Quaver             // 八分音符
        case Semiquaver         // 十六分音符
        case Demisemiquaver     // 32分
        case Hemidemisemiquaver // 64分
        case Other
    }
    
    var clef: Clef  //
    var note: Note    // 暂时不用
    var ad: Ad
    var beat: Beat
    var pos: Position
    
}