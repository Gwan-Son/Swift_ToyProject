//
//  ContentView.swift
//  StockRank_SwiftUI
//
//  Created by 심관혁 on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var list = StockModel.list
    
    var body: some View {
        
        NavigationView {
            List($list) { $stock in
                ZStack {
                    NavigationLink {
                        StockDetailView(stock: $stock)
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
