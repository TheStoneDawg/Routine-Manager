//
//  Routine.swift
//  Routine Manager
//
//  Created by Samuel Resendez on 5/11/15.
//  Copyright (c) 2015 Samuel Resendez. All rights reserved.
//

import UIKit
import RealmSwift

class Routine: Object {
    dynamic var name = ""
    dynamic var startValue = 0.0
    dynamic var event = ""
    var skills = List<Skill>()
}
