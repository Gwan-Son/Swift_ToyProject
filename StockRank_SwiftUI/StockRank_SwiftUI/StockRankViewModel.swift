//
//  StockRankViewModel.swift
//  StockRank_SwiftUI
//
//  Created by 심관혁 on 4/18/24.
//

import Foundation

final class StockRankViewModel: ObservableObject {
    @Published var models: [StockModel] = StockModel.list
    
    var numberOfFavorite: Int {
        return models.filter { $0.isFavorite }.count
    }
}
