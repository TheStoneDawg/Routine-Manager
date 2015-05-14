//
//  Gymnast.swift
//  Routine Manager
//
//  Created by Samuel Resendez on 5/11/15.
//  Copyright (c) 2015 Samuel Resendez. All rights reserved.
//

import UIKit
import RealmSwift

class Gymnast: Object {
    dynamic var name = ""
    var routines = List<Routine>()
}
