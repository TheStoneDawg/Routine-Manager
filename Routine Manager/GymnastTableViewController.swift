//
//  GymnastTableViewController.swift
//  Routine Manager
//
//  Created by Samuel Resendez on 5/11/15.
//  Copyright (c) 2015 Samuel Resendez. All rights reserved.
//

import UIKit
import RealmSwift

class GymnastTableViewController: UITableViewController {
    
    //Keep Until Development Finished: Helps with realm Migrations
    override func viewDidLoad() {
        println(Realm.defaultPath)
    }
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData() 
    }
    
    //FINISHED
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var gymnasts = Realm().objects(Gymnast)
        return gymnasts.count
    }

    //FINISHED, WITH BASIC CELLSTYLE FUNCTIONALITY
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("gymnastIdentifier", forIndexPath: indexPath) as! UITableViewCell
        
        let gymnastResults = Realm().objects(Gymnast)
        let gymnast = gymnastResults[indexPath.row]
        cell.textLabel!.text = gymnast.name
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let dest = segue.destinationViewController as? RoutineTableViewController {
            if let cell = sender as? UITableViewCell {
                dest.nameOfGymnast = cell.textLabel!.text!
            }
        }
    }
}
