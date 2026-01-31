//
//  SwiftFulCryptoApp.swift
//  SwiftFulCrypto
//
//  Created by Shafakhat on 24/01/26.
//

import SwiftUI
//import CoreData

@main
struct SwiftFulCryptoApp: App {
    @StateObject private var vm = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]

    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .navigationBarHidden(true)

            }
            .environmentObject(vm)
        }
    }
}
