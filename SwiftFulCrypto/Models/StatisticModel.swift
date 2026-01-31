//
//  StatisticModel.swift
//  SwiftFulCrypto
//
//  Created by Shafakhat on 28/01/26.
//

import Foundation

struct StatisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil){
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}

let newModel = StatisticModel(title: "New", value: "0", percentageChange: nil)
let new24hModel = StatisticModel(title: "New (24h)", value: "0")
