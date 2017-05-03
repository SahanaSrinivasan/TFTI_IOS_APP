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

var localEvents: [Event] = []
var goingEvents: [Event] = []

func getEventFromIndexPath(indexPath: IndexPath) -> Event? {
    //let sectionName = threadNames[indexPath.section]
    
    return localEvents[indexPath.row]
}

func addEventToArray(event: Event) {
    localEvents.append(event)
}
func clearArray() {
    localEvents.removeAll()
}
func addEvent(name: String, location: String, dateOfEvent: String, username: String, description: String) {
    let dbRef = FIRDatabase.database().reference()

    let format = DateFormatter()
    format.dateFormat = dateFormat
    let date = format.string(from: Date())
    let valueDictionary = [firNameNode: name, firHostNode: username, firDatePostedNode: date, firDateOfEventNode: dateOfEvent, firLocationNode: location, firDescriptionNode: description]
    
    dbRef.child(firEventsNode).childByAutoId().setValue(valueDictionary)
}

func getEvents(user: CurrentUser, completion: @escaping ([Event]?) -> Void) {
    let dbRef = FIRDatabase.database().reference()
    var eventArray: [Event] = []
    
    dbRef.child(firEventsNode).observeSingleEvent(of: .value, with: {
        (snapshot) in
        if snapshot.exists() {
            let values = snapshot.value as? [String: AnyObject]
            user.getGoingEventIDs(completion: {(goingEvents) in
                for (key, object) in values! {
                    var eventHost = ""
                    var eventDescription = ""
                    var eventDate = ""
                    var eventLocation = ""
                    var eventName = ""
                    
                    if let DBhost = object.value(forKey: firHostNode) as? String {
                        eventHost = DBhost
                    }
                    
                    if let DBdate = object.value(forKey: firDateOfEventNode) as? String {
                        eventDate = DBdate
                    }
                    
                    if let DBdescription = object.value(forKey: firDescriptionNode) as? String {
                        eventDescription = DBdescription
                    }
                    
                    if let DBlocation = object.value(forKey: firLocationNode) as? String {
                        eventLocation = DBlocation
                    }
                    
                    if let DBname = object.value(forKey: firNameNode) as? String {
                        eventName = DBname
                    }
                    
                    var isAttending = goingEvents.contains(key)
                    let format = DateFormatter()
                    format.dateFormat = dateFormat
                    let currentDate = format.string(from: Date())
                    
                    let eventObj = Event(id: key, name: eventName, description: eventDescription, host: eventHost, location: eventLocation, dateOfEventString: eventDate, datePostedString: currentDate , attending: isAttending)
                    eventArray.append(eventObj)
                }
                
                completion(eventArray)
            })
        } else {
            completion(nil)
        }
    })}
