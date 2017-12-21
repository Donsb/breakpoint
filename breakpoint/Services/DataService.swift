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
    
    /* Publica Variables to set values and use the data. */
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
    
    
    // Functions.
    
    /* Create DB User Function. */
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
            //-> uid is Unique Identifier for the user.
    } // END Create DB User Function.
    
    
    /* Get User Name Function. */
    func getUsername(forUID uid: String, handler: @escaping (_ username: String)-> ()) {
        REF_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
            guard let userSnapShot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in userSnapShot {
                if user.key == uid {
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
        }
    } // END Get User Name Function.
    
    
    /* Upload Post Function. */
    func uploadPost(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, sendComplete: @escaping (_ status: Bool)-> ()) {
        
        if groupKey != nil {
            // Send to group ref
        } else {
            REF_FEED.childByAutoId().updateChildValues(["content": message, "senderId": uid])
            sendComplete(true)
        }
        
    } // END Upload Post Function.
    
    
    /* Get All Feed Messages Function. */
    func getAllFeeMessages(handler: @escaping (_ messages: [Message])-> ()) {
        var messageArray = [Message]()
        REF_FEED.observeSingleEvent(of: .value) { (feedMessageSnapshot) in
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for message in feedMessageSnapshot {
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderId = message.childSnapshot(forPath: "senderId").value as! String
                let message = Message(content: content, senderId: senderId)
                messageArray.append(message)
            }
            handler(messageArray)
        }
    } // END Get All Feed Messages Function.
    
    
} // END Class.


































