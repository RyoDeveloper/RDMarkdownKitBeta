//
//  File.swift
//
//
//  https://github.com/RyoDeveloper/RDMarkdownKit
//  Copyright © 2023 RyoDeveloper. All rights reserved.
//

import Foundation

func MarkdownsSplit(_ text: String) -> [String] {
    let Newline = text.components(separatedBy: "\n")
    var Array: [String] = []
    var isCodeBlock = false
    var temCode = ""

    for code in Newline {
        if code == "```" {
            if isCodeBlock {
                // コードブロック終了
                temCode += code
                Array += [temCode]
                temCode = ""
                isCodeBlock = false
                // "```"が2つ入らないように
                continue
            } else {
                // コードブロック開始
                isCodeBlock = true
            }
        }
        if isCodeBlock == true {
            // コードブロック中
            temCode += code + "\n"
        } else {
            // コードブロック以外
            if code.prefix(2) == "> " && Array.last?.prefix(2) == "> " {
                let fuge = String(code)
                // 引用
                Array[Array.count - 1] += "\n" + fuge
            } else {
                // それ以外
                Array += [String(code)]
            }
        }
    }
    Array += [temCode]
    return Array
}
