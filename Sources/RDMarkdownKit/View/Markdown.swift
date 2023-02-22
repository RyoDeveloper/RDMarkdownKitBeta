//
//  Markdown.swift
//
//
//  https://github.com/RyoDeveloper/RDMarkdownKit
//  Copyright © 2023 RyoDeveloper. All rights reserved.
//

import SwiftUI

public struct Markdown: View {
    @Binding var text: String
    @State var arryText: [String]
    @AppStorage("isLargeImage") var isLargeImage = false

    public init(_ text: Binding<String>) {
        self._text = text
        self.arryText = MarkdownsSplit(text.wrappedValue)
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 4.0) {
                ForEach(arryText, id: \.self) { line in
                    switch getMarkdownStyle(text: line) {
                    case .heading1:
                        Text(line.getAttributedString())
                            .font(.largeTitle)
                            .fontWeight(.medium)
                        Divider()
                    case .heading2:
                        Text(line.getAttributedString())
                            .font(.title)
                            .fontWeight(.medium)
                        Divider()
                    case .heading3:
                        Text(line.getAttributedString())
                            .font(.title2)
                            .fontWeight(.medium)
                    case .heading4:
                        Text(line.getAttributedString())
                            .font(.title3)
                            .fontWeight(.medium)
                    case .heading5:
                        Text(line.getAttributedString())
                            .fontWeight(.medium)
                    case .heading6:
                        Text(line.getAttributedString())
                            .fontWeight(.medium)
                    case .list:
                        ListColumnView(line)
                    case .numlist:
                        NumlistColumnView(line)
                    case .link:
                        Text(line.getAttributedString())
                    case .image:
                        ImageColumnView(line)
                    case .code:
                        CodeBlockColumnView(line)
                    case .quote:
                        QuoteColumnView(line)
                    case .footnote:
                        Text(footnoteText(line))
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                    case .delimiter:
                        Divider()
                    case .body:
                        Text(line.getAttributedString())
                    }
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .onChange(of: text) { _ in
            arryText = MarkdownsSplit(text)
        }
    }
}

struct Markdown_Previews: PreviewProvider {
    static var previews: some View {
        Markdown(.constant("""
        # 見出し
        ## 見出し2
        ### 見出し3
        #### 見出し4
        ##### 見出し5
        ###### 見出し6
        - リスト
        * リスト
        1. 番号付きリスト
        2. 番号付きリスト
        [GitHub](https://github.com/RyoDeveloper)
        ![アイコン](https://avatars.githubusercontent.com/u/121738322?v=4)
        ```
        コードブロック
        012
        ```
        > 引用1
        [^1]:脚注の内容その1
        *イタリック*
        **太字**
        ~~打ち消し線~~
        インライン`code`
        """))
    }
}
