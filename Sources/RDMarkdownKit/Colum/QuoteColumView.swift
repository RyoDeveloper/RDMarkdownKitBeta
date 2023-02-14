//
//  QuoteColumView.swift
//
//
//  https://github.com/RyoDeveloper/RDMarkdownKit
//  Copyright © 2023 RyoDeveloper. All rights reserved.
//

import SwiftUI

struct QuoteColumView: View {
    @State var text: [String]
    init(_ text: String) {
        // self.text = text
        self.text = text.components(separatedBy: "\n")
    }

    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 5, height: 0.0)
            VStack {
                ForEach(text, id: \.self) { a in
                    Text(a.getAttributedString())
                }
            }
            .padding(.vertical, 5.0)
        }
        .background(
            HStack {
                Rectangle()
                    .foregroundColor(.gray.opacity(0.4))
                    .frame(width: 5)
                    .frame(maxHeight: .infinity)
                    .cornerRadius(10)
                Spacer()
            }
        )
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

struct QuoteColumView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteColumView("> A\n> B")
    }
}
