//
//  TodoTableViewController.swift
//  Todo
//
//  Created by Kaio Henrique on 04/11/15.
//  Copyright © 2015 kaiobrito. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    
    @IBAction func addTodo(sender: AnyObject) {
        let alert = UIAlertController(title: "Add Todo", message: "Type your todo", preferredStyle: .Alert)
        
        //Add TextField on alert
        alert.addTextFieldWithConfigurationHandler(
            {(textfield) in
                textfield.placeholder = "Todo";
        });
        
        //add alert actions
        alert.addAction(UIAlertAction(title: "Save", style: .Default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        //Presenting alert
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
