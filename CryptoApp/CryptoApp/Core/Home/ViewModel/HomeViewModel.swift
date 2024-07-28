//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Karamjeet Singh on 14/07/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics : [StatisticModel] = [
        StatisticModel(title: "Title", value: "Value", percentageChnage: 12),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value", percentageChnage: -12),

    ]
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    private let coinDataService = CoinDataService()
    private let marketDatService = MarketDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            self.allCoins.append(DeveloperPreview.instance.coin)
//            self.portfolioCoins.append(DeveloperPreview.instance.coin)
//        }
        
        addSubscribers()
    }
    
    func addSubscribers() {
        coinDataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map (filterCoins)
            .sink { [weak self] returnedCoin in
                self?.allCoins = returnedCoin
            }
            .store(in: &cancellables)
        
        marketDatService.$marketData
            .map{ (marketDataModel) -> [StatisticModel] in
                var stats: [StatisticModel] = []
                
                guard let data = marketDataModel else {
                    return stats
                }
                
                let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChnage: data.marketCapChangePercentage24HUsd)
                stats.append(marketCap)
                
                let volume = StatisticModel(title: "24h Volume", value: data.volume)
                stats.append(volume)
                
                let btcDominance = StatisticModel(title: "BTC Domiance", value: data.btcDominance)
                stats.append(btcDominance)
                
                let portfolio = StatisticModel(title: "Portfolio Value", value: "$0.00", percentageChnage: 0)
                stats.append(portfolio)

                //stats.append(contentsOf: Sequence)
                return stats
                
            }
            .sink { [weak self] returendStats in
                self?.statistics = returendStats
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        
        guard !text.isEmpty else {
            return coins
        }
        let lowercaseText = text.lowercased()
        
        return coins.filter { coin -> Bool in
            return coin.name.lowercased().contains(lowercaseText) ||
            coin.symbol.lowercased().contains(lowercaseText) ||
            coin.id.lowercased().contains(lowercaseText)
        }
        
    }
}
