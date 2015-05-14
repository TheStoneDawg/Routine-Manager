//
//  NewGymnastViewController.swift
//  Routine Manager
//
//  Created by Samuel Resendez on 5/11/15.
//  Copyright (c) 2015 Samuel Resendez. All rights reserved.
//

import UIKit
import RealmSwift

class NewGymnastViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBAction func DonePressed(sender: UIBarButtonItem) {
        let realm = Realm()
        let gymnast = Gymnast()
        gymnast.name = nameTextField.text
        realm.write {
            realm.add(gymnast)
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
}
