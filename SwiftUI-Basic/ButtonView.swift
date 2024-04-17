//
//  ButtonView.swift
//  SwiftUI-Basic
//
//  Created by 심관혁 on 4/17/24.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        Button(action: {
            print("Button Tapped")
        }, label: {
            Text("Click Me")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color.white)
        })
        .padding()
        .frame(height: 100)
        .background(.pink)
        .cornerRadius(20)
        
    }
}

#Preview {
    ButtonView()
}
