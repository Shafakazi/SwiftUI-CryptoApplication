//
//  marketDataservice.swift
//  SwiftFulCrypto
//
//  Created by Shafakhat on 29/01/26.
//

import Foundation
import Combine

class MarketDataService {
    @Published var marketData: MarketDataModel? = nil
    var marketDataSubcription: AnyCancellable?

    init() {
        getData()
    }

    func getData() {
        guard let url = URL(string:
            "https://api.coingecko.com/api/v3/global"
        ) else { return }

        marketDataSubcription = NetworkingManager.download(url: url)
            .decode(type: GlobalDate.self, decoder: JSONDecoder())
            .sink(
                receiveCompletion: NetworkingManager.handleCompletion,
                receiveValue: { [weak self] (returnGlobalData) in
                    self?.marketData = returnGlobalData.data
                    self?.marketDataSubcription?.cancel()
                }
            )
    }
}
