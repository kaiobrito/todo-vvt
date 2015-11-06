//
//  Todo+CoreDataProperties.swift
//  Todo
//
//  Created by Kaio Henrique on 05/11/15.
//  Copyright © 2015 kaiobrito. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Todo {

    @NSManaged var value: String?
    @NSManaged var checked: NSNumber?

}
