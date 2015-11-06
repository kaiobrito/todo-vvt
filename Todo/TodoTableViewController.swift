//
//  TodoTableViewController.swift
//  Todo
//
//  Created by Kaio Henrique on 04/11/15.
//  Copyright © 2015 kaiobrito. All rights reserved.
//

import UIKit
import CoreData

class TodoTableViewController: UITableViewController,NSFetchedResultsControllerDelegate {
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    var datasource:NSFetchedResultsController!;
    let reuseIdentifier = "TodoCell";
    var manageContext:NSManagedObjectContext!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest = NSFetchRequest(entityName: "Todo")
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "value", ascending: true)];
        
        self.datasource = Todo.fetchedResults(manageContext);
        self.datasource.delegate = self
        do{
            try self.datasource.performFetch();
        }catch{
            print(error)
            abort()
        }
    }
    
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
    //MARK: NSFetchedResultsControllerDelegate
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        self.tableView.endUpdates()
    }
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        self.tableView.beginUpdates()
    }
    
    //MARK: Datasource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.sections![section].numberOfObjects;
    }
    
    //MARK: Delegate
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let todo = datasource.objectAtIndexPath(indexPath);
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: reuseIdentifier)
        cell.accessoryType = UITableViewCellAccessoryType.Checkmark;
        cell.textLabel?.text = todo.valueForKey("value") as? String;
        return cell;
    }
}
