//
//  AddListViewModel.swift
//  SwiftUI-CoreData
//
//  Created by Moh Zinnur Atthufail Addausi on 15/09/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
import Combine

class OrderListViewModel : ObservableObject {
    @Published var orders = [OrderViewModel]()
    
    init(){
        fetchAllOrder()
        
    }
    func fetchAllOrder(){
        self.orders = CoreDataManager.shared.getAllOder().map(OrderViewModel.init)
        print(orders)
    }
    
    func deleteOrder(_ orderVM : OrderViewModel) {
        CoreDataManager.shared.deleteOrder(name: orderVM.name)
        fetchAllOrder()
    }
}


class OrderViewModel {
    var name = ""
    var type = ""
    
    init(order : Order){
        self.name = order.name!
        self.type = order.type!
    }
    
}
