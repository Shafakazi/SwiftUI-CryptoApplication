//
//  CoinImageService.swift
//  SwiftFulCrypto
//
//  Created by Shafakhat on 27/01/26.
//

import Foundation
import Combine
import SwiftUI
class CoinImageService {
    @Published var image: UIImage? = nil
    
   private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "Coin_images"
    private let imageName: String
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
       getCoinImage()
    }
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
          //  print("Retrived image from File Manager")
        } else {
            downloadCoinImage()
            //print("Downloading image now")
        }
    }
    private func downloadCoinImage() {
        print("Downloading Image now")
        guard let url = URL(string: coin.image) else { return }

        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            //.decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(
                receiveCompletion: NetworkingManager.handleCompletion,
                receiveValue: { [weak self] (returnImage) in
                    guard let self = self, let downloadingImage = returnImage else { return }
                    self.image = downloadingImage
                    self.imageSubscription?.cancel()
                    self.fileManager.saveImage(image:  downloadingImage, imageName: self.imageName, folderName: self.folderName)
                }
            )
    }
}
