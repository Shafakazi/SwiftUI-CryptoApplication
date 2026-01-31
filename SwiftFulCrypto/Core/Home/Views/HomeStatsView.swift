//
//  HomeStatsView.swift
//  SwiftFulCrypto
//
//  Created by Shafakhat on 28/01/26.
//

import SwiftUI

struct HomeStatsView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showProtfolio: Bool
    var body: some View {
        HStack{
            ForEach(vm.statistics) {
                stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: .trailing)
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeStatsView(showProtfolio: .constant(false))
            .environmentObject(dev.homeVM)
    }
}
