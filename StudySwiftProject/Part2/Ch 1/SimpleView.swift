//
//  SimpleView.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 11/29/23.
//  Part 2. Ch 1. 02. 간단한 화면에 필요한 요소들 손대보기

import SwiftUI

struct SimpleView: View {
    var body: some View {
        VStack{
            Image(systemName: "pencil")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Text("HeadLine 입니다")
                .font(.headline)
                .bold()
                .padding()
            
            Text("SubHeadLine 입니다")
                .font(.subheadline)
                .padding()
            
            Text("Body 입니다")
                .font(.body)
                .padding()
            
            Button(action: {}, label: {
                Text("Click me")
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .bold()
            })
            
        }
    }
}

#Preview {
    SimpleView()
}
