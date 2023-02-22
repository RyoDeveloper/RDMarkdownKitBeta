//
//  ImageColumnView.swift
//
//
//  https://github.com/RyoDeveloper/RDMarkdownKit
//  Copyright © 2023 RyoDeveloper. All rights reserved.
//

import SwiftUI

struct ImageColumnView: View {
    @AppStorage("isLargeImage") var isLargeImage = true
    @State var text: String
    @State private var url: URL

    init(_ text: String) {
        self._text = State(initialValue: text)
        self._url = State(initialValue: imageUrl(text))
    }

    var body: some View {
        HStack {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .contextMenu {
                        Button {
                            isLargeImage.toggle()
                        } label: {
                            Label(isLargeImage ? "拡大" : "縮小", systemImage: isLargeImage ? "arrow.up.backward.and.arrow.down.forward" : "arrow.down.right.and.arrow.up.left")
                        }
                    }
                    .animation(.default, value: isLargeImage)
            } placeholder: {
                HStack {
                    ProgressView()
                    // 代替テキスト
                    Text(text.getAttributedString())
                }
            }
            if isLargeImage {
                Spacer()
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

struct ImageColumnView_Previews: PreviewProvider {
    static var previews: some View {
        ImageColumnView("![アイコン](https://avatars.githubusercontent.com/u/121738322?v=4)")
    }
}
