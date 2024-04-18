//
//  ContentView.swift
//  StockRank_SwiftUI
//
//  Created by 심관혁 on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    
    
    @StateObject var viewModel = StockRankViewModel()
    
    var body: some View {
        
        NavigationView {
            List($viewModel.models) { $stock in
                ZStack {
                    NavigationLink {
                        StockDetailView(viewModel: viewModel, stock: $stock)
                    } label: {
                        EmptyView()
                    }
                    StockRankRow(stock: $stock)
                }
                .listRowInsets(EdgeInsets())
                .frame(height: 80)
            }
            .listStyle(.plain)
            .navigationTitle("Stock Rank")
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
