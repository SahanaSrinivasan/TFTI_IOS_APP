//
//  EventFeed.swift
//  TFTI_Final_Project
//
//  Created by pal on 4/30/17.
//  Copyright © 2017 Sahana Srinivasan. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

func addEvent(name: String, location: String, dateOfEvent: String, username: String) {
    let dbRef = FIRDatabase.database().reference()
//    let data = UIImageJPEGRepresentation(postImage, 1.0)!
//    let path = "\(firStorageImagesPath)/\(UUID().uuidString)"
    
    let format = DateFormatter()
    format.dateFormat = dateFormat
    let date = format.string(from: Date())
    print("negros")
    let valueDictionary = [firNameNode: name, firHostNode: username, firDatePostedNode: date, firDateOfEventNode: dateOfEvent, firLocationNode: location]
    print("adding child")
    
    dbRef.child(firEventsNode).childByAutoId().setValue(valueDictionary)
}
