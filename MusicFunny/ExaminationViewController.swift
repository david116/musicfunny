//
//  TestingViewController.swift
//  MusicFunny
//
//  Created by leelei on 16/6/7.
//  Copyright © 2016年 leelei. All rights reserved.
//

import UIKit

class ExaminationViewController: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    
    private let trebleNoteTable = [
        StaveExpression.Note.B_Xi,
        StaveExpression.Note.A_La,
        StaveExpression.Note.G_So,
        StaveExpression.Note.F_Fa,
        StaveExpression.Note.E_Mi,
        StaveExpression.Note.D_Re,
        StaveExpression.Note.C_Do,
        StaveExpression.Note.B_Xi,
        StaveExpression.Note.A_La,
        StaveExpression.Note.G_So,
        StaveExpression.Note.F_Fa,
        StaveExpression.Note.E_Mi,
        StaveExpression.Note.D_Re,
        StaveExpression.Note.C_Do,
        StaveExpression.Note.B_Xi,
        StaveExpression.Note.A_La,
        StaveExpression.Note.G_So,        // G 基准线
        StaveExpression.Note.F_Fa,
        StaveExpression.Note.E_Mi,
        StaveExpression.Note.D_Re,
        StaveExpression.Note.C_Do,
        StaveExpression.Note.B_Xi,
        StaveExpression.Note.A_La,
        StaveExpression.Note.G_So,
        StaveExpression.Note.F_Fa,
        StaveExpression.Note.E_Mi,
        StaveExpression.Note.D_Re,
        StaveExpression.Note.C_Do,
        StaveExpression.Note.B_Xi]
    private let bassNoteTable = [
        StaveExpression.Note.D_Re,
        StaveExpression.Note.C_Do,
        StaveExpression.Note.B_Xi,
        StaveExpression.Note.A_La,
        StaveExpression.Note.G_So,
        StaveExpression.Note.F_Fa,
        StaveExpression.Note.E_Mi,
        StaveExpression.Note.D_Re,
        StaveExpression.Note.C_Do,
        StaveExpression.Note.B_Xi,
        StaveExpression.Note.A_La,
        StaveExpression.Note.G_So,
        StaveExpression.Note.F_Fa,      // F 基准线
        StaveExpression.Note.E_Mi,
        StaveExpression.Note.D_Re,
        StaveExpression.Note.C_Do,
        StaveExpression.Note.B_Xi,
        StaveExpression.Note.A_La,
        StaveExpression.Note.G_So,
        StaveExpression.Note.F_Fa,
        StaveExpression.Note.E_Mi,
        StaveExpression.Note.D_Re,
        StaveExpression.Note.C_Do,
        StaveExpression.Note.B_Xi,
        StaveExpression.Note.A_La,
        StaveExpression.Note.G_So,
        StaveExpression.Note.F_Fa,
        StaveExpression.Note.E_Mi,
        StaveExpression.Note.D_Re]
    // 根据对应位置取得音符名
    func readNoteByClef(clef:StaveExpression.Clef, position:Int) -> StaveExpression.Note
    {
        var note = StaveExpression.Note.C_Do
        switch clef {
        case .Treble:
            note = trebleNoteTable[position-1]
        case .Bass:
            note = bassNoteTable[position-1]
        case .Alto:
            note = StaveExpression.Note.E_Mi
        default:
            break
        }
        return note
    }
    
    var expression = StaveExpression(clef: .Bass, note: .C_Do, ad: .Normal, beat: .Whole, pos: .Base_Line_2) {
        didSet {
            updateUI() // Model changed, so update the View
        }
    }
    
    @IBAction func answerOperation(sender: UIButton) {
        //print("staveView.pos: \(staveView.position)")
        let currentNote = readNoteByClef(staveView.clef, position: staveView.position)
        //print("answer: \(sender.currentTitle), NowNote: \(currentNote)")
        if sender.currentTitle == currentNote.rawValue {
            lblResult.text = "Bingo! 答对了！"
        } else {
            lblResult.text = "Ahoo.. 答错了！"
        }
        
        // 根据设置的级别来随机生成音符表和位置
        let newClef = StaveExpression.Clef(rawValue: Int(arc4random_uniform(2)))    // 2 means 2 clef now , G & f
        
        var pos = 1
        while (pos > 22 || pos < 10)
        {
            pos = Int(arc4random_uniform(29)) + 1
        }
        let newPosition = StaveExpression.Position(rawValue: pos)
        //print("position: \(newPosition!.rawValue)")
        expression = StaveExpression(clef: newClef!, note: .C_Do, ad: .Normal, beat: .Whole, pos: newPosition!)
    }
    
    @IBOutlet weak var staveView: StaveView! {
        didSet{
            updateUI()
        }
    }
    
    private func updateUI() {
        if staveView != nil {
            staveView.ad = expression.ad
            staveView.clef = expression.clef
            staveView.beat = expression.beat
            //staveView.note = expression.note
            //staveView.position = 1
            //staveView.position = notePostions[expression.pos] ?? 16
            staveView.position = expression.pos.rawValue
        }
    }

}


