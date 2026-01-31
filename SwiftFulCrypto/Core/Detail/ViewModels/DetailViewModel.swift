//
//  DetailViewModel.swift
//  SwiftFulCrypto
//
//  Created by Shafakhat on 31/01/26.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    private let coinDetailService: CoinDetailDataService
    private var cancellables: Set<AnyCancellable> = []
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .sink {
                (returnedCoinDetaills) in
                print("RECIEVED DATA COIN DETAIL DATA")
                print(returnedCoinDetaills)
            
        }
            .store(in: &cancellables)
    }
    
}
