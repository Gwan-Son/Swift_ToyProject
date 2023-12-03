//
//  MyButton.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 11/30/23.
//  Part 2. Ch 1. 03. 레이아웃 잡기

import SwiftUI

struct MyButton: View {
    var buttonTitle: String
    var buttonColor: Color
    
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text(buttonTitle)
                .padding()
                .background(buttonColor)
                .foregroundColor(.white)
                .cornerRadius(10)
                .font(.headline)
        })
    }
}

#Preview {
    MyButton(buttonTitle: "Button 4", buttonColor: .brown)
}
