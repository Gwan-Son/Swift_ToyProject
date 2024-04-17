//
//  ContentView.swift
//  AppleFramework_SwiftUI
//
//  Created by 심관혁 on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var frameworks: [AppleFramework] = AppleFramework.list
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout) {
                    
                    ForEach(frameworks) { item in
                        FrameworkCell(framework: item)
                    }
                }
                .padding([.top,.leading,.trailing], 16)
            }
            .navigationTitle("☀️ Apple Framework")
        }
    }
}

#Preview {
    ContentView()
}
