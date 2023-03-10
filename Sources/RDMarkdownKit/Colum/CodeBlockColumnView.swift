//
//  CodeBlockColumnView.swift
//
//
//  https://github.com/RyoDeveloper/RDMarkdownKit
//  Copyright © 2023 RyoDeveloper. All rights reserved.
//

import SwiftUI

struct CodeBlockColumnView: View {
    @AppStorage("isScroll") var isScroll = false
    @State var code: String

    init(_ code: String) {
        self.code = code
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Group {
                if isScroll {
                    ScrollView(.horizontal, showsIndicators: false) {
                        Text(codeText(code))
                    }
                } else {
                    Text(codeText(code))
                }
            }
            .textSelection(.enabled)
            .padding()
            .font(.system(.body, design: .monospaced))
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .background(Color.primary.opacity(0.1))
            .cornerRadius(10)
            .contextMenu {
                Button {
                    isScroll.toggle()
                } label: {
                    Label(isScroll ? "折り返す" : "折り返さない", systemImage: isScroll ? "arrow.up.backward.and.arrow.down.forward" : "arrow.down.right.and.arrow.up.left")
                }
            }
        }
    }
}

struct CodeBlockColumnView_Previews: PreviewProvider {
    static var previews: some View {
        CodeBlockColumnView("""
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
