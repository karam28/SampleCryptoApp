//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Karamjeet Singh on 14/07/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var allCoints: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.allCoints.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
    
}
