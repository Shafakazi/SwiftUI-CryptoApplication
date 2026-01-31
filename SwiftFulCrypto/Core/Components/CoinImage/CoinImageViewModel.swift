//
//  CoinImageViewModel.swift
//  SwiftFulCrypto
//
//  Created by Shafakhat on 27/01/26.
//

import Foundation
import SwiftUI
import Combine
class CoinImageViewModel: ObservableObject{

@Published var image: UIImage? = nil
@Published var isLoading: Bool = false
    private let coin: CoinModel
    private let dataService: CoinImageService
    private var cancellables = Set<AnyCancellable>()
    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.addSubcribers()
        self.isLoading = true
  //  getImage()
        
    }
    private func addSubcribers() {
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage)in
                self?.image = returnedImage
                
            }
            .store(in: &cancellables)
        
    }
}

