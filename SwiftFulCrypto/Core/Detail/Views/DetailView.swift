//
//  DetailView.swift
//  SwiftFulCrypto
//
//  Created by Shafakhat on 31/01/26.
//

import SwiftUI
struct DetailLoadingView: View {
    @Binding var coin: CoinModel?
    var body: some View {
        ZStack
        {
            if let coin = coin{
                DetailView(coin: coin)
            }
        }
    }
}


struct DetailView: View {
    
    @StateObject var vm: DetailViewModel
    //let coin: CoinModel
    
    //@Binding  var coin: CoinModel?
    init(coin: CoinModel)
    {
        //self.coin = coin
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
        print("Intitializer Details View for \(coin.name)")
    }
    var body: some View {
        Text("Hello")
    }
}


struct DetailView_Previews: PreviewProvider {
    //@available(iOS 13.0, *)
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
