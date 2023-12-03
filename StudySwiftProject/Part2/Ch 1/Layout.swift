//
//  Layout.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 11/29/23.
//  Part 2. Ch 1. 03. 레이아웃 잡기

import SwiftUI

struct Layout: View {
    var body: some View {
        VStack{
            Image(systemName: "pencil")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            MyText(textString: "Text Element 1", textFont: .headline)
            MyText(textString: "Text Element 2", textFont: .subheadline)
            MyText(textString: "Text Element 3", textFont: .body)

            
            HStack{
                MyButton(buttonTitle: "Button 1", buttonColor: .blue)
                MyButton(buttonTitle: "Button 2", buttonColor: .cyan)
            }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                VStack{
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    Text("Complex Button")
                }
                .foregroundColor(.white)
                .padding()
                .background(.orange)
                .cornerRadius(10)
            })
        }
    }
}

#Preview {
    Layout()
}
