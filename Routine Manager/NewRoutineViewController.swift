//
//  NewRoutineViewController.swift
//  Routine Manager
//
//  Created by Samuel Resendez on 5/13/15.
//  Copyright (c) 2015 Samuel Resendez. All rights reserved.
//

import UIKit
import RealmSwift

class NewRoutineViewController: UIViewController {
    //set by previous view Controller!
    var nameOfGymnast = ""
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var eventSegControl: UISegmentedControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        println(self.nameOfGymnast)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //Finished, but untested!
    @IBAction func donePressed(sender: UIBarButtonItem) {
        let routine = Routine()
        routine.name = nameTextField.text
        routine.event = eventSegControl.titleForSegmentAtIndex(eventSegControl.selectedSegmentIndex)!
        let gymnastResult = Realm().objects(Gymnast).filter("name = %@",self.nameOfGymnast)
        let gymnast = gymnastResult.first
        println(gymnastResult)
        Realm().write{
            gymnast!.routines.append(routine)
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
