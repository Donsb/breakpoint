//
//  DataService.swift
//  breakpoint
//
//  Created by Donald Belliveau on 2017-12-19.
//  Copyright © 2017 Donald Belliveau. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference() // Gets a FIRDatabaseReference for the root of your Firebase Database.

class DataService {
    
    // Singleton
    static let instance = DataService()
    
    // Instance Variables
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users") // Creates a Folder to hold all the users in database.
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    
} // END Class.




