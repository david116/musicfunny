//
//  NoteUtils.swift
//  MusicFunny
//
//  Created by ihefe039 on 16/6/8.
//  Copyright © 2016年 leelei. All rights reserved.
//

import Foundation

class NoteUtils {

    
    func readNoteByClef(clef:StaveExpression.Clef, position:StaveExpression.Position) -> StaveExpression.Note
    {
        var note = StaveExpression.Note.C_Do
        var offset = 1
        switch clef {
        case .Treble:
            //offset = noteTables["Treble"][position]
            note = StaveExpression.Note.E_Mi
        case .Bass:
            note = StaveExpression.Note.E_Mi
        case .Alto:
            note = StaveExpression.Note.E_Mi
        default:
            break
        }
        return note
    }
}