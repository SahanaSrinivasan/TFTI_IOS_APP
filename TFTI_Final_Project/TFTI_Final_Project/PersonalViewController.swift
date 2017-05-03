//
//  PersonalViewController.swift
//  TFTI_Final_Project
//
//  Created by Sahana Srinivasan on 4/24/17.
//  Copyright © 2017 Sahana Srinivasan. All rights reserved.
//

import UIKit

class PersonalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var personalEventsTable: UITableView!
    let currentUser = CurrentUser()
    var selectedEvent: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personalEventsTable.delegate = self
        personalEventsTable.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                    
                    if (i.isAttending == true) {
                        addEventToArray(event: i)
                    }
                }
                self.personalEventsTable.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personalcell", for: indexPath) as! PersonalCellViewController
        if let event = getEventFromIndexPath(indexPath: indexPath) {
            
            let format = DateFormatter()
            format.dateFormat = dateFormat
            let dateOfEvent = format.string(from: event.dateOfEvent)
            
            cell.nameOfEvent.text = event.name
            cell.dateOfEvent.text = dateOfEvent
            cell.locationOfEvent.text = event.location
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let event = getEventFromIndexPath(indexPath: indexPath) {
            selectedEvent = event
            performSegue(withIdentifier: "personal-details", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "personal-details" {
                let format = DateFormatter()
                format.dateFormat = dateFormat
                let dateOfEvent = format.string(from: (selectedEvent?.dateOfEvent)!)
                print(dateOfEvent)
                if let destination = segue.destination as? DetailsViewController {
                    if let selected = selectedEvent {
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
