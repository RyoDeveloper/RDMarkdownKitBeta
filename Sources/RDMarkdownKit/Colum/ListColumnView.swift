//
//  ListColumnView.swift
//
//
//  https://github.com/RyoDeveloper/RDMarkdownKit
//  Copyright © 2023 RyoDeveloper. All rights reserved.
//

import SwiftUI

struct ListColumnView: View {
    @State var text: String
    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Text("  •  ")
                .fontWeight(.semibold)
            Text(text.getAttributedString())
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

struct ListColumnView_Previews: PreviewProvider {
    static var previews: some View {
        ListColumnView("- a")
    }
}
