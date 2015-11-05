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
    var datasource:[AnyObject] = []
    let reuseIdentifier = "TodoCell";
    
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
    
    //MARK: Datasource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: reuseIdentifier)
        return cell;
    }
}
