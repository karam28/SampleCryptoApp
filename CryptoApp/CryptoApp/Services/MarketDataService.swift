//
//  MarketDataService.swift
//  CryptoApp
//
//  Created by Karamjeet Singh on 25/07/24.
//

import Foundation
import Combine

class MarketDataService {
    
    
    @Published var marketData: MarketDataModel? = nil
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    private func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else {return}

        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returenedGlobalData in
                self?.marketData = returenedGlobalData.data
                self?.marketDataSubscription?.cancel()
            })

    }
    
}
