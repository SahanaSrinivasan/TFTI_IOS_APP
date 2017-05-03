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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personalEventsTable.delegate = self
        personalEventsTable.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func updateData() {
        
        getEvents(user: currentUser) {
            (events) in
            if let events = events {
                clearArray()
                for i in events {
                    print(i.name)
                    if self.currentUser.goingEventIDs.contains(i.postId) {
                        addEventToArray(event: i)
                    }
                }
                print("UPDATE DATA")
                self.personalEventsTable.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currentUser.goingEventIDs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testglobalcell", for: indexPath) as! testGlobalViewCell
        if let event = getEventFromIndexPath(indexPath: indexPath) {
            
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("dont touch me please baby")
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
