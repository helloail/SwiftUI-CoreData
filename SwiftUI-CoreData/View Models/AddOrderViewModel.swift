//
//  AddOrderViewModel.swift
//  SwiftUI-CoreData
//
//  Created by Moh Zinnur Atthufail Addausi on 15/09/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import Foundation
import SwiftUI

class AddOrderViewModel {
    var name : String = ""
    var type : String = ""
    
    func save() {
        CoreDataManager.shared.saveOrder(name: self.name, type: self.type)
        
    }
    
}
