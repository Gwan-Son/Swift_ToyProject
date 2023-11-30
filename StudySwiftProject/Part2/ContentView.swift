//
//  ContentView.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 11/29/23.
//  Part 2. Ch 1. 01. 코딩 없이 화면 그리기

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.green)
                .padding(.all)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
