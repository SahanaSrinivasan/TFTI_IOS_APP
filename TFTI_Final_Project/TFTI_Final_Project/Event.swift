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
    var location: String
    let host: String
    let postId: String
    
    init(id: String, host: String, location: String, dateOfEventString: String, datePostedString: String) {
        self.postId = id
        self.host = host
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormatter
        self.dateOfEvent = dateFormatter.date(from: dateOfEventString)!
        self.datePosted = dateFormatter.dated(from: datePostedString)!
    }
    
    func getTimeElapsedString() -> String {
        let secondsSincePosted = -date.timeIntervalSinceNow
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
