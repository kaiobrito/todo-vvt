//
//  TodoTableViewController.swift
//  Todo
//
//  Created by Kaio Henrique on 04/11/15.
//  Copyright © 2015 kaiobrito. All rights reserved.
//

import XCTest

class TodoTableViewControllerTest: XCTestCase {
    
    var viewController:TodoTableViewController!
    
    override func setUp() {
        super.setUp()
        
        //Initial configuration for controllers test
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        
        self.viewController = storyboard.instantiateViewControllerWithIdentifier("TodoTableViewController") as! TodoTableViewController;
        UIApplication.sharedApplication().keyWindow!.rootViewController = viewController

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAddTodoButtonHasPressed() {
        XCTAssertNil(self.viewController.presentedViewController)
        
        self.viewController.addTodo(self)
        
        let alertController = self.viewController.presentedViewController as! UIAlertController

        XCTAssertNotNil(alertController)

    }


}
