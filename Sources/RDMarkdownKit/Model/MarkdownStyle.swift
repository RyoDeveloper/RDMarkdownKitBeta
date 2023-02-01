//
//  MarkdownStyle.swift
//  
//
//  https://github.com/RyoDeveloper/RDMarkdownKit
//  Copyright © 2023 RyoDeveloper. All rights reserved.
//

import Foundation

enum MarkdownStyle {
    /// 見出し1(# )
    case heading1
    /// 見出し2(## )
    case heading2
    /// 見出し3(### )
    case heading3
    /// 見出し4(#### )
    case heading4
    /// 見出し5(##### )
    case heading5
    /// 見出し6(###### )
    case heading6
    /// リスト(- )
    case list
    /// 番号付きリスト(1. )
    case numlist
    /// リンク([]())
    case link
    /// 画像(![]())
    case image
    /// コードブロック(``` ```)
    case code
    /// 引用(> )
    case quote
    /// 脚注[^1] ※未実装
    case footnote
    /// 本文
    case body
    
}
func getMarkdownStyle(text: String) -> MarkdownStyle {
    if text.prefix(2) == "# " {
        return .heading1
    } else if text.prefix(3) == "## " {
        return .heading2
    } else if text.prefix(4) == "### " {
        return .heading3
    } else if text.prefix(5) == "#### " {
        return .heading4
    } else if text.prefix(6) == "##### " {
        return .heading5
    } else if text.prefix(7) == "###### " {
        return .heading6
    } else if regex(text, type: .list) {
        return .list
    } else if regex(text, type: .numlist) {
        return .numlist
    } else if text.prefix(1) == "" {
        return .link
    } else if regex(text, type: .image){
        return .image
    } else if text.prefix(3) == "```" {
        return .code
    } else if regex(text, type: .quote) {
        return .quote
    } else if text.prefix(1) == "" {
        return .footnote
    } else {
        return .body
    }
}
