//
//  testGlobalController.swift
//  TFTI_Final_Project
//
//  Created by pal on 5/2/17.
//  Copyright © 2017 Sahana Srinivasan. All rights reserved.
//

import UIKit

class testGlobalController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    let currentUser = CurrentUser()
    var selectedEvent: Event?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //table.delegate = self
        //table.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateData()
    }
    
    func updateData() {
        
        getEvents(user: currentUser) {
            (events) in
            if let events = events {
                clearArray()
                for i in events {
                    //print("HELLO")
                    //print(i.postId)
                    if (i.isAttending == false) {
                        print("ENTERED !ISATTENDING")
                        addEventToArray(event: i)
                    }
                }
                self.table.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testglobalcell", for: indexPath) as! testGlobalViewCell
        if let event = getEventFromIndexPath(indexPath: indexPath) {
            /*if event.isAttending {
             cell.goingImage.image = UIImage(named: "going")
             }
             else {
             cell.goingImage.image = UIImage(named: "notGoing")
             } */
            let format = DateFormatter()
            format.dateFormat = dateFormat
            let dateOfEvent = format.string(from: event.dateOfEvent)
        
            cell.eventName.text = event.name
            //print(event.name)
            cell.dateOfEvent.text = dateOfEvent
            cell.location.text = event.location
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let event = getEventFromIndexPath(indexPath: indexPath) {
            selectedEvent = event
            print("PRINT NAME")
            print(selectedEvent!.name)
            performSegue(withIdentifier: "feed-details", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "feed-details" {
                print("ENTERERED PREPARE")
                let format = DateFormatter()
                format.dateFormat = dateFormat
                let dateOfEvent = format.string(from: (selectedEvent?.dateOfEvent)!)
                print(dateOfEvent)
                if let destination = segue.destination as? DetailsViewController {
                    if let selected = selectedEvent {
                        print("YA")
                        print(selected.name)
                        destination.eventID = selected.postId
                        destination.name = selected.name
                        destination.date = dateOfEvent
                        destination.location = selected.location
                        destination.details = selected.description
                    }
                    
                }
            }
        }
    }

}
