//
//  StockDetailView.swift
//  StockRank_SwiftUI
//
//  Created by 심관혁 on 4/18/24.
//

import SwiftUI

struct StockDetailView: View {
    
    @ObservedObject var viewModel: StockRankViewModel
    @Binding var stock: StockModel
    
    var body: some View {
        VStack(spacing: 40) {
            Text("# of My Favorite: \(viewModel.numberOfFavorite)")
                .font(.system(size: 20, weight: .bold))
            Image(stock.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
            Text(stock.name)
                .font(.system(size: 30, weight: .bold))
            Text("\(stock.price) 원")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(stock.diff > 0 ? .red : .blue)
            
            Button(action: {
                stock.isFavorite.toggle()
            }, label: {
                Image(systemName: "heart.fill")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .foregroundColor(stock.isFavorite ? .white : .gray)
                    .frame(width: 80, height: 80)
            })
            
        }
    }
}

#Preview {
    StockDetailView(viewModel: StockRankViewModel(), stock: .constant(StockModel.list[0]))
        .preferredColorScheme(.dark)
}
