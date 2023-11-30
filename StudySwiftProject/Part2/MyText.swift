//
//  MyText.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 11/30/23.
//  Part 2. Ch 1. 03. 레이아웃 잡기

import SwiftUI

struct MyText: View {
    var textString: String
    var textFont: Font
    
    var body: some View {
        Text(textString)
            .font(textFont)
            .padding()
    }
}

#Preview {
    MyText(textString: "Text", textFont: .body)
}
