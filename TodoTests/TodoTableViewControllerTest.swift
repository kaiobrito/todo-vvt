//
//  TodoTableViewController.swift
//  Todo
//
//  Created by Kaio Henrique on 04/11/15.
//  Copyright © 2015 kaiobrito. All rights reserved.
//

import XCTest
import CoreData

class TodoTableViewControllerTest: XCTestCase {
    
    var viewController:TodoTableViewController!
    let coreData:CoreDataStack = TestCoreDataStack()
    
    override func setUp() {
        super.setUp()
        
        //Initial configuration for controllers test
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        
        self.viewController = storyboard.instantiateViewControllerWithIdentifier("TodoTableViewController") as! TodoTableViewController;
        viewController.manageContext = coreData.managedObjectContext;
        UIApplication.sharedApplication().keyWindow!.rootViewController = viewController
    }
    
    func insertDummyData(){
        let entity = NSEntityDescription.entityForName("Todo", inManagedObjectContext: coreData.managedObjectContext);
        
        let record = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: coreData.managedObjectContext)
        
        record.setValue("Todo", forKey: "value")
        do{
         try self.coreData.managedObjectContext.save()
        }catch{
            print(error)
            abort()
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAddTodoButtonHasPressed() {
        self.viewController.viewDidLoad()
        
        XCTAssertNil(self.viewController.presentedViewController)
        
        self.viewController.addTodo(self)
        
        let alertController = self.viewController.presentedViewController as! UIAlertController

        XCTAssertNotNil(alertController)

    }
    
    //MARK:Datasource
    
    func testnumberOfRowsInSection(){
        self.viewController.viewDidLoad()
        let tableview = self.viewController.tableView;
        
        XCTAssertEqual(self.viewController.tableView(tableview, numberOfRowsInSection: 0), 0)
        insertDummyData();
        do{
            try self.viewController.datasource.performFetch()
        }catch{
            XCTFail()
        }
        XCTAssertEqual(self.viewController.tableView(tableview, numberOfRowsInSection: 0), 1)
        
    }
    
    func testCellForRowAtIndexPath(){
        let tableview = self.viewController.tableView;
        let cell = self.viewController.tableView(tableview, cellForRowAtIndexPath: NSIndexPath(forItem: 0, inSection: 0))
        
        
    }


}
