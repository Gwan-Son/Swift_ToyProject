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
        ScrollView {
            ForEach(list, id: \.self) { stock in
                StockRankRow(stock: stock)
                    .frame(height: 80)
            }
        }
        .background(.black)
    }
}

#Preview {
    ContentView()
}
