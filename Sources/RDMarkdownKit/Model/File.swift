//
//  File.swift
//  
//
//  https://github.com/RyoDeveloper/RDMarkdownKit
//  Copyright © 2023 RyoDeveloper. All rights reserved.
//

import Foundation

func MarkdownsSplit(_ text: String) -> [String] {
    let Newline = text.split(whereSeparator: \.isNewline)
    var Array:[String] = []
    var isCoodeBlock = false
    var temCode = ""

    for code in Newline {
        if code == "```" {
            if isCoodeBlock {
                // コードブロック終了
                temCode += code
                Array += [temCode]
                temCode = ""
                isCoodeBlock = false
                // "```"が2つ入らないように
                continue
            } else {
                // コードブロック開始
                isCoodeBlock = true
            }
        }
        if isCoodeBlock == true {
            // コードブロック中
            temCode += code + "\n"
        } else {
            // コードブロック以外
            Array += [String(code)]
        }
    }
    return Array
}
