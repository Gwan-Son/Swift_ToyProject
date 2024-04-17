//
//  ContentView.swift
//  SwiftUI-Basic
//
//  Created by 심관혁 on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ImageView()
            ButtonView()
            TextView()
            HStack {
                ImageView()
                ButtonView()
                TextView()
            }
            ZStack {
                ImageView()
                ButtonView()
                TextView()
            }
        }
    }
}

#Preview {
    ContentView()
}
