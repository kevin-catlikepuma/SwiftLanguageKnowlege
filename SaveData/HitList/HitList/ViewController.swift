//
//  ViewController.swift
//  HitList
//
//  Created by WeiWen on 16/3/28.
//  Copyright © 2016年 WeiWen. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {

//    var names = [String]()
    
    var people = [NSManagedObject]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addName(sender: AnyObject) {
        let alert = UIAlertController(title: "New Name",
            message: "Add a new name",
            preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save",
            style: .Default,
            handler: { (action:UIAlertAction) -> Void in
                
                let textField = alert.textFields!.first
                //self.names.append(textField!.text!)
                self.saveName(textField!.text!)
                self.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel",
            style: .Default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert,
            animated: true,
            completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\"The List\""
        
 //       tableView.registerClass(UITableViewCell.self, forHeaderFooterViewReuseIdentifier: "Cell")
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Person")
        
        //3
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            people = results as! [NSManagedObject]
            
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")

        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        let person = people[indexPath.row]
        
        cell!.textLabel!.text = person.valueForKey("name") as? String
        
        return cell!
    }
    
    func saveName(name: String) {
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
        
        let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        //3
        person.setValue(name, forKey: "name")
        
        //4
        do {
            try managedContext.save()
            //5
            people.append(person)
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
}
