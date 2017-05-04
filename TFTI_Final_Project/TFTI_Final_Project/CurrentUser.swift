//
//  CurrentUser.swift
//  TFTI_Final_Project
//
//  Created by pal on 5/1/17.
//  Copyright © 2017 Sahana Srinivasan. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class CurrentUser {
    
    var username: String!
    var id: String!
    var goingEventIDs: [String] = []
    
    let dbRef = FIRDatabase.database().reference()
    
    init() {
        let currentUser = FIRAuth.auth()?.currentUser
        username = currentUser?.displayName
        id = currentUser?.uid
    }
    
  
    
    func getGoingEventIDs(completion: @escaping ([String]) -> Void) {
        var eventArray: [String] = []
        
        dbRef.child(firUsersNode).child(id).child(firGoingEventsNode).observeSingleEvent(of: .value, with: {
            (snapshot) in
            if snapshot.exists() {
                if let valueDictionary = snapshot.value as? [String: AnyObject] {
                    for key in valueDictionary.keys {
                        eventArray.append(valueDictionary[key] as! String)
                    }
                }
            }
            completion(eventArray)
        })
    }
    
    
    
    func addNewReadPost(postID: String) {
        if goingEventIDs.contains(postID) == false {
            goingEventIDs.append(postID)
            dbRef.child(firUsersNode).child(id).child(firGoingEventsNode).child(postID).setValue(postID)
        }
    }
    
    func leaveEvent(postID: String) {
        dbRef.child(firUsersNode).child(id).child(firGoingEventsNode).child(postID).setValue(nil)
    }
    
}

