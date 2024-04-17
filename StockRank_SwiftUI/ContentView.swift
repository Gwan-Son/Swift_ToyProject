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
        
        List(list) { stock in
            StockRankRow(stock: stock)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .frame(height: 80)
        }
        .listStyle(.plain)
        .background(.black)

        
//        List를 사용하지 않는 방법
//        ScrollView {
//            ForEach(list, id: \.self) { stock in
//                StockRankRow(stock: stock)
//                    .frame(height: 80)
//            }
//        }
//        .background(.black)
    }
}

#Preview {
    ContentView()
}
