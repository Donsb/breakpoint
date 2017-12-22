//
//  Group.swift
//  breakpoint
//
//  Created by Donald Belliveau on 2017-12-21.
//  Copyright © 2017 Donald Belliveau. All rights reserved.
//

import Foundation

class Group {
    
    // Instance Variables
    
    private var _groupTitle: String
    private var _groupDescription: String
    private var _key: String
    private var _memberCount: Int
    private var _members: [String]
    
    var groupTitle: String {
        return _groupTitle
    }
    
    var groupDescription: String {
        return _groupDescription
    }
    
    var key: String {
        return _key
    }
    
    var memberCount: Int {
        return _memberCount
    }
    
    var members: [String] {
        return _members
    }
    
    // Initializers
    
    init(title: String, description: String, key: String, members: [String], memberCount: Int) {
        self._groupTitle = title
        self._groupDescription = description
        self._members = members
        self._key = key
        self._memberCount = memberCount
    } // END init.
    
} // END Class.

























