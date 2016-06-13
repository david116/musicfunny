//
//  TestingViewController.swift
//  MusicFunny
//
//  Created by ihefe039 on 16/6/7.
//  Copyright © 2016年 leelei. All rights reserved.
//

import UIKit

class ExaminationViewController: UIViewController {
    /*
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    */
    let util = NoteUtils()
    
    var expression = StaveExpression(clef: .Bass, note: .C_Do, ad: .Normal, beat: .Whole, pos: .Base_Line_2) {
        didSet {
            updateUI() // Model changed, so update the View
        }
    }
    
    @IBAction func changeStave(sender: UIButton) {
        expression = StaveExpression(clef: .Bass, note: .C_Do, ad: .Normal, beat: .Whole, pos: .Base_Line_2)
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
    /*
    private var notePostions = [StaveExpression.Position.Top_Line_1:1,
        StaveExpression.Position.Top_Line_2:2,
        StaveExpression.Position.Top_Line_3:3,
        StaveExpression.Position.Top_Line_4:4,
        StaveExpression.Position.Top_Line_5:5,
        StaveExpression.Position.Top_Blank_1:6,
        StaveExpression.Position.Top_Blank_2:7,
        StaveExpression.Position.Top_Blank_3:8,
        StaveExpression.Position.Top_Blank_4:9,
        StaveExpression.Position.Top_Blank_5:10,
        
        StaveExpression.Position.Base_Line_1:11,
        StaveExpression.Position.Base_Line_2:12,
        StaveExpression.Position.Base_Line_3:13,
        StaveExpression.Position.Base_Line_4:14,
        StaveExpression.Position.Base_Line_5:15,
        StaveExpression.Position.Base_Blank_1:16,
        StaveExpression.Position.Base_Blank_2:17,
        StaveExpression.Position.Base_Blank_3:18,
        StaveExpression.Position.Base_Blank_4:19,
        
        StaveExpression.Position.Bottom_Line_1:20,
        StaveExpression.Position.Bottom_Line_2:21,
        StaveExpression.Position.Bottom_Line_3:22,
        StaveExpression.Position.Bottom_Line_4:23,
        StaveExpression.Position.Bottom_Line_5:24,
        StaveExpression.Position.Bottom_Blank_1:25,
        StaveExpression.Position.Bottom_Blank_2:26,
        StaveExpression.Position.Bottom_Blank_3:27,
        StaveExpression.Position.Bottom_Blank_4:28,
        StaveExpression.Position.Bottom_Blank_5:29
        ]
        */
}


