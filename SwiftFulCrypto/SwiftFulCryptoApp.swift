//
//  SwiftFulCryptoApp.swift
//  SwiftFulCrypto
//
//  Created by Shafakhat on 24/01/26.
//

import SwiftUI
import CoreData

@main
struct SwiftFulCryptoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
