//
//  PortfolioDataService.swift
//  SwiftFulCrypto
//
//  Created by Shafakhat on 31/01/26.
//

import Foundation
import CoreData
import Combine

class PortfolioDataService{
    
    private let container: NSPersistentContainer
    private let containerName: String = "PortfolioContainer"
    private let entiyName: String = "PortfolioEntity"
    
    @Published var savedEntities: [PortfolioEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { (_, error) in
            if let error = error {
                print("Error loading core Data \(error)")
            }
            self.getPortfolio()
            
        }
    }
    //public section
    
    func updatePortfolio(coin: CoinModel, amount: Double){
        
        //check if coin is already in portfolio
        if let entity = savedEntities.first(where: { $0.coinID == coin.id}) {
            if amount > 0{
                update(entity: entity, amount: amount)
            } else {
                delete(entity: entity)
            }
        }else {
                add(coin: coin, amount: amount)
            }
            
        }
    
    
    
    
    //private section
    private func getPortfolio() {
        let request = NSFetchRequest<PortfolioEntity>(entityName: entiyName)
        do {
            try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching portfolio \(error)")
        }
    }
    private func add(coin: CoinModel, amount: Double) {
        let entity = PortfolioEntity(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        applyChanges()
    }
    private func update(entity: PortfolioEntity, amount: Double)
    {
        entity.amount = amount
        applyChanges()
    }
    private func delete(entity: PortfolioEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        }
        catch let error {
            print("Error saving to core Data. \(error)")
        }
    }
    private func applyChanges() {
        save()
        getPortfolio()
    }
}
