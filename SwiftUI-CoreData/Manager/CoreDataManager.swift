//
//  CoreDataManager.swift
//  SwiftUI-CoreData
//
//  Created by Moh Zinnur Atthufail Addausi on 14/09/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    var moc : NSManagedObjectContext
    
    static let shared  = CoreDataManager(moc: NSManagedObjectContext.current)
    
    private init(moc : NSManagedObjectContext) {
        self.moc = moc
    }
    
    private func fetchOrder(name : String) -> Order? {
        var order = [Order]()
        
        let request : NSFetchRequest<Order> = Order.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", name )
        
        do{
            order = try self.moc.fetch(request)
        }catch let error as NSError{
            print(error)
            
        }
        print(order.first)
        
        return order.first
    }
    
    func deleteOrder(name : String) {
        do {
            if let order = fetchOrder(name: name){
    
                self.moc.delete(order)
                try self.moc.save()
            }
        }catch let error as NSError{
            print(error)
            
        }
    }
    
    func getAllOder() -> [Order] {
        var orders = [Order]()
        let orderrequest : NSFetchRequest<Order> = Order.fetchRequest()
        
        do{
            orders = try self.moc.fetch(orderrequest)
        }catch let error as NSError {
            print(error)
            
        }
        return orders
    }
    
    
    func saveOrder(name : String, type : String ){
        let order = Order(context: self.moc)
        order.name = name
        order.type = type
        
        do{
            try self.moc.save()
        }catch let error as NSError{
            print(error )
        }
    }
}
