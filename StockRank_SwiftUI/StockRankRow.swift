//
//  StockRankRow.swift
//  StockRank_SwiftUI
//
//  Created by 심관혁 on 4/17/24.
//

import SwiftUI

struct StockRankRow: View {
    
    var stock: StockModel
    
    var body: some View {
        HStack {
            Text("\(stock.rank)")
                .foregroundColor(.blue)
                .font(.system(size: 16, weight: .bold))
                .frame(width: 30)
            Image(stock.imageName)
                .resizable()
                .frame(width: 40, height: 40)
                .padding()
            VStack(alignment: .leading, spacing: 5) {
                Text("\(stock.name)")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
                HStack {
                    Text("\(stock.price) 원")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    Text("\(stock.diff * 100, specifier: "%.2f")%")
                        .font(.system(size: 12))
                        .foregroundColor(stock.diff > 0 ? .red : .blue)
                }
            }
            
            Spacer()
            
            Image(systemName: "heart.fill")
                .renderingMode(.template)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.black)
    }
}

#Preview {
    StockRankRow(stock: StockModel.list[0])
}
