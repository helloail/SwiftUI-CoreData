//
//  NSManageObjectContect+Extentions.swift
//  SwiftUI-CoreData
//
//  Created by Moh Zinnur Atthufail Addausi on 14/09/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension NSManagedObjectContext{
    
    static var current : NSManagedObjectContext{
        let delagete = UIApplication.shared.delegate as! AppDelegate
        return delagete.persistentContainer.viewContext
    }
}
