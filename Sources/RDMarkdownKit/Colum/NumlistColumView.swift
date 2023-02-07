//
//  NumlistColumView.swift
//  
//
//  https://github.com/RyoDeveloper/RDMarkdownKit
//  Copyright © 2023 RyoDeveloper. All rights reserved.
//

import SwiftUI

struct NumlistColumView: View {
    @State var text: String
    init(_ text: String) {
        self.text = text
    }
        
    var body: some View {
        HStack {
            Text(hogenum(text)+".")
            Text(text.getAttributedString())
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

struct NumlistColumView_Previews: PreviewProvider {
    static var previews: some View {
        NumlistColumView("1. NumList")
    }
}
