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
        
        print("ENTERED VIEWDIDLOAD GLOBAL")

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
        print("ENTERED numbers GLOBAL")
        print(localEvents.count)
        return localEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("ENTERED CELLS GLOBAL")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "globalcell", for: indexPath) as! GlobalCellViewController
        print("ONE")
        if let event = getEventFromIndexPath(indexPath: indexPath) {
            print("TWO")
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
            print("NIGGAS")
            print(event.name)
            cell.dateOfEvent.text = dateOfEvent
            cell.location.text = event.location
        }
        return cell
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
