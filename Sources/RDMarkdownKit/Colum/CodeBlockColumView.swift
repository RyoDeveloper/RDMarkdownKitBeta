//
//  CodeBlockColumView.swift
//  
//
//  https://github.com/RyoDeveloper/RDMarkdownKit
//  Copyright © 2023 RyoDeveloper. All rights reserved.
//

import SwiftUI

struct CodeBlockColumView: View {
    @State var code: String
    @State var fileName: String?
    
    init(_ text: String) {
        var hoge = text
        if hoge.prefix(3) == "```" {
            hoge.removeFirst(4)
        }
        if hoge.suffix(3) == "```" {
            hoge.removeLast(4)
        }
        self.code = hoge
        
        fileName = "apple.swift"
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let fileName {
                Text(fileName)
                    .font(.footnote)
                    .padding([.top, .leading, .trailing], 4)
                    .background(Color(.systemGray4))
            }
            Text(code)
                .textSelection(.enabled)
                .padding()
                .font(.system(.body, design: .monospaced))
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(Color(.systemGray4))
        }
    }
}

struct CodeBlockColumView_Previews: PreviewProvider {
    static var previews: some View {
        CodeBlockColumView("""
```
struct CodeBlockView: View {
    @State var code = ""

    var body: some View {
        Text(code)
    }
}
```
""")
    }
}
