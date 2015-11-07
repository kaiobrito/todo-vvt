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
    let dummyTodo = "Todo?";
    
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
        let record = Todo(context: coreData.managedObjectContext)
        record.value = dummyTodo;

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
        XCTAssertEqual(self.viewController.tableView(tableview, numberOfRowsInSection: 0), 1)
        
    }
    
    func testCellForRowAtIndexPath(){
        let tableview = self.viewController.tableView;
        insertDummyData();
        let cell = self.viewController.tableView(tableview, cellForRowAtIndexPath: NSIndexPath(forItem: 0, inSection: 0))
        
        XCTAssertEqual(dummyTodo, cell.textLabel?.text)                        
    }
    
    func testRemoveRowAtIndexPath(){
        let tableview = self.viewController.tableView;
        insertDummyData();
        XCTAssertEqual(self.viewController.tableView(tableview, numberOfRowsInSection: 0), 1)
        self.viewController.tableView(tableview, commitEditingStyle: .Delete, forRowAtIndexPath: NSIndexPath(forItem: 0, inSection: 0))
        XCTAssertEqual(self.viewController.tableView(tableview, numberOfRowsInSection: 0), 0)
    }
    
    
}
