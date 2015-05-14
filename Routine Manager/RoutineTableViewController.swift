//
//  RoutineTableViewController.swift
//  Routine Manager
//
//  Created by Samuel Resendez on 5/12/15.
//  Copyright (c) 2015 Samuel Resendez. All rights reserved.
//

import UIKit
import RealmSwift

class RoutineTableViewController: UITableViewController {
    //Received from previous ViewController
    var nameOfGymnast = ""

    override func viewWillAppear(animated: Bool) {

        self.tableView.reloadData()
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //FINISHED
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let gymnast = Realm().objects(Gymnast).filter("name = %@",self.nameOfGymnast).first
        return gymnast!.routines.count
    }

    //FINISHED
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("routinesIdentifier", forIndexPath: indexPath) as! UITableViewCell
        let gymnast = Realm().objects(Gymnast).filter("name = %@",self.nameOfGymnast).first
        let routine = gymnast!.routines[indexPath.row]
        
        cell.textLabel!.text = routine.name
        var roundedStringStartValue = NSString(format: "%.02f", routine.startValue)
        cell.detailTextLabel!.text = roundedStringStartValue as String
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let dest = segue.destinationViewController as? NewRoutineViewController {
            dest.nameOfGymnast = self.nameOfGymnast
        }
    }

}
