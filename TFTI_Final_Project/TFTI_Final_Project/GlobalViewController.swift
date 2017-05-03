//
//  GlobalViewController.swift
//  TFTI_Final_Project
//
//  Created by Sahana Srinivasan on 4/24/17.
//  Copyright © 2017 Sahana Srinivasan. All rights reserved.
//

import UIKit
import FirebaseDatabase

class GlobalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var eventsTable: UITableView!
    
     let currentUser = CurrentUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventsTable.delegate = self
        eventsTable.dataSource = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // YOUR CODE HERE
        updateData()
    }
    
    func updateData() {
        // YOUR CODE HERE
        getEvents(user: currentUser) {
            (events) in
            if let events = events {
                clearArray()
                for i in events {
                    addEventToArray(event: i)
                }
                self.eventsTable.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "globalcell", for: indexPath) as! GlobalCellViewController
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
            print(event.name)
            cell.dateOfEvent.text = dateOfEvent
            cell.location.text = event.location
        }
        return cell
    }

}
