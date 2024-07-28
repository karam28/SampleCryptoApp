//
//  StatisticModel.swift
//  CryptoApp
//
//  Created by Karamjeet Singh on 24/07/24.
//

import Foundation

struct StatisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChnage: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChnage
    }
}

let newModel = StatisticModel(title: "", value: "", percentageChnage: nil)
