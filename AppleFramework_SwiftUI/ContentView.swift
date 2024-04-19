//
//  ContentView.swift
//  AppleFramework_SwiftUI
//
//  Created by 심관혁 on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = FrameworkListViewModel()
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout) {
                    
                    ForEach($viewModel.framework) { $item in
                        FrameworkCell(framework: $item)
                            .onTapGesture {
                                viewModel.isShowingDetail = true
                                viewModel.selectedItem = item
                            }
                    }
                }
                .padding([.top,.leading,.trailing], 16)
            }
            .navigationTitle("☀️ Apple Framework")
        }
        .sheet(isPresented: $viewModel.isShowingDetail, content: {
            let vm = FrameworkDetailViewModel(framework: viewModel.selectedItem!)
            FrameworkDetailView(viewModel: vm)
        })
    }
}

#Preview {
    ContentView()
}
