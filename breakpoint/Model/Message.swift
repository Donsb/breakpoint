//
//  Message.swift
//  breakpoint
//
//  Created by Donald Belliveau on 2017-12-21.
//  Copyright © 2017 Donald Belliveau. All rights reserved.
//

import Foundation

class Message {
    
    // Instance Variables
    
        // Private Variables.
    private var _content: String
    private var _senderId: String
    
        // Public Variables.
    var content: String {
        return _content
    }
    
    var senderId: String {
        return _senderId
    }
    
    // Initlaizer.
    
    init(content: String, senderId: String) {
        self._content = content
        self._senderId = senderId
    } // End init.
    
} // END Class.
