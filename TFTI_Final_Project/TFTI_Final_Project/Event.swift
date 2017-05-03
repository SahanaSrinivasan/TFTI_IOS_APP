//
//  Event.swift
//  TFTI_Final_Project
//
//  Created by Sahana Srinivasan on 4/24/17.
//  Copyright © 2017 Sahana Srinivasan. All rights reserved.
//

import Foundation
import UIKit

class Event {
    let datePosted: Date
    var dateOfEvent: Date
    var isAttending: Bool
    var location: String
    var name: String
    var description: String
    let host: String
    let postId: String
    
    
    
    
    init(id: String, name: String, description: String, host: String, location: String, dateOfEventString: String, datePostedString: String, attending: Bool) {
        self.postId = id
        self.name = name
        self.description = description
        self.host = host
        self.isAttending = attending
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        self.dateOfEvent = dateFormatter.date(from: dateOfEventString)!
        self.datePosted = dateFormatter.date(from: datePostedString)!
        self.location = location;
    }
    
    func getAttendance() -> Bool {
        return self.isAttending
    }
    
    func setAttendance(attendance: Bool) {
        self.isAttending = attendance
    }
    
  
    
    func getDatePostedString() -> String {
        let secondsSincePosted = -datePosted.timeIntervalSinceNow
        let minutes = Int(secondsSincePosted / 60)
        if minutes == 1 {
            return "\(minutes) minute ago"
        } else if minutes < 60 {
            return "\(minutes) minutes ago "
        } else if minutes < 120 {
            return "1 hour ago"
        } else if minutes < 24 * 60 {
            return "\(minutes / 60) hours ago"
        } else if minutes < 48 * 60 {
            return "1 day ago"
        } else {
            return "\(minutes / 1440) days ago"
        }
    }
    

    
    
    
}
