//
//  Regex.swift
//
//
//  https://github.com/RyoDeveloper/RDMarkdownKit
//  Copyright © 2023 RyoDeveloper. All rights reserved.
//

import Foundation
import RegexBuilder

func regex(_ text: String, type: MarkdownStyle) -> Bool {
    if type == .list {
        if text.wholeMatch(of: list) != nil {
            return true
        }
    } else if type == .numlist {
        if text.firstMatch(of: numlist) != nil {
            return true
        }
    } else if type == .image {
        if text.wholeMatch(of: image) != nil {
            return true
        }
    } else if type == .quote {
        if text.wholeMatch(of: quote) != nil {
            return true
        }
    } else if type == .footnote {
        if text.wholeMatch(of: footnote) != nil {
            return true
        }
    } else if type == .delimiter {
        if text.wholeMatch(of: delimiter) != nil {
            return true
        }
    }
    return false
}

func imageUrl(_ text: String) -> URL {
    var url = ""

    if let match = text.wholeMatch(of: image) {
        url = String(match.2) // https://developer.apple.com)
        if url.suffix(1) == ")" {
            url.removeLast(1) // https://developer.apple.com
        }
    }
    return URL(string: url)!
}

func numListText(_ text: String) -> String {
    var url = ""
    if let match = text.firstMatch(of: numlist) {
        url = String(match.1)
    }
    return url
}

func footnoteText(_ text: String) -> String {
    var text = text
    if let match = text.firstMatch(of: footnote) {
        text.removeFirst(match.1.count)
        text = String(match.2) + ". " + text
    }
    return text
}

let list = Regex {
    ZeroOrMore(.whitespace)
    ChoiceOf {
        "- "
        "* "
        "+ "
    }
    ZeroOrMore(.any)
}

let numlist = Regex {
    Capture {
        OneOrMore(.digit)
    }
    ". "
}

let image = Regex {
    "!["
    Capture {
        ZeroOrMore(.any)
    }
    "]("
    Capture {
        ZeroOrMore(.url(), .eager)
    }
}

let quote = Regex {
    ">"
    " "
    ZeroOrMore(.any)
}

let footnote = Regex {
    Capture {
        "[^"
        Capture {
            OneOrMore(.digit)
        }
        "]:"
    }
    ZeroOrMore(.any)
}

let delimiter = Regex {
    ZeroOrMore(.whitespace)
    ChoiceOf {
        "***"
        "---"
        "___"
    }
    ZeroOrMore(.any)
}
