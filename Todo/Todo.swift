//
//  Todo.swift
//  Todo
//
//  Created by Kaio Henrique on 05/11/15.
//  Copyright © 2015 kaiobrito. All rights reserved.
//

import Foundation
import CoreData

private let entityName = "Todo";
class Todo: NSManagedObject {
    
    init(insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        let entity = NSEntityDescription.entityForName(entityName, inManagedObjectContext: context!);
        super.init(entity: entity!, insertIntoManagedObjectContext: context)
    }
    
    class func fetchedResults(context: NSManagedObjectContext)->NSFetchedResultsController{
        let fetchRequest = NSFetchRequest(entityName: entityName)
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "value", ascending: true)];
        
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
}
