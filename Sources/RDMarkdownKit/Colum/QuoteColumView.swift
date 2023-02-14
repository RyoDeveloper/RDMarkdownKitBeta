//
//  QuoteColumView.swift
//
//
//  https://github.com/RyoDeveloper/RDMarkdownKit
//  Copyright © 2023 RyoDeveloper. All rights reserved.
//

import SwiftUI

struct QuoteColumView: View {
    @State var text: String
    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 5, height: 0.0)
            Text(text.getAttributedString())
        }
        .background(
            HStack {
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 5)
                    .frame(maxHeight: .infinity)
                Spacer()
            }
        )
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

struct QuoteColumView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteColumView("> A")
    }
}
