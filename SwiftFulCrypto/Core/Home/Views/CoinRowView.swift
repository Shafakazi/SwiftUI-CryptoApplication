//
//  CoinRowView.swift
//  SwiftFulCrypto
//
//  Created by Shafakhat on 24/01/26.
//

import SwiftUI

struct CoinRowView: View {
    let coin: CoinModel
    let showHoldingColumn: Bool
    
    var body: some View {
        HStack{
            letColuwn
            Spacer()
            if showHoldingColumn{
                centerColuwn
            }
            rightColuwn

        }
        .font(.subheadline)
        .background(Color.theme.background.opacity(0.00))
    }
}
struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CoinRowView(coin: dev.coin, showHoldingColumn: true)
                .previewLayout(.sizeThatFits)
            CoinRowView(coin: dev.coin, showHoldingColumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
                .preferredColorScheme(.dark)


    }
}
    
        

        
    }


extension CoinRowView{
    private var letColuwn: some View {
        HStack{
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.Secondary)
                .frame(minWidth: 30)
          //  Circle()
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding()
                .foregroundColor(Color.theme.accent)
        }

    }
    private var centerColuwn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color.theme.accent)
    }
    private var rightColuwn: some View {
        VStack(alignment: .trailing){
            Text("\(coin.currentPrice.asCurrencyWith6Decimals())")
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundColor((coin.priceChangePercentage24H ?? 0) >= 0 ?
            Color.theme.green :
            Color.theme.red)
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)

    }

}

