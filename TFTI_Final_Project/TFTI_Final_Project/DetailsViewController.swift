//
//  DetailsViewController.swift
//  TFTI_Final_Project
//
//  Created by Sahana Srinivasan on 4/24/17.
//  Copyright © 2017 Sahana Srinivasan. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    let currentUser = CurrentUser()
    var eventID: String = ""
    var name: String = ""
    var date: String = ""
    var location: String = ""
    var details: String = ""
    var attending: Bool = false;
    
    @IBOutlet weak var joinButton: UIButton!
    
    @IBAction func joinPressed(_ sender: Any) {
        
        attending = !attending
        if (attending == true) {
            joinButton.setTitle("Leave", for: .normal)
            print("CALLING ADD")
            self.currentUser.addNewReadPost(postID: eventID)
        } else {
            joinButton.setTitle("Join", for: .normal)
            currentUser.leaveEvent(postID: eventID)
            
        }
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        performSegue(withIdentifier: "details-feed", sender: self)
    }
    @IBOutlet weak var nameOfEvent: UILabel!
    @IBOutlet weak var descriptionOfEventLabel: UILabel!
    @IBOutlet weak var locationOfEventLabel: UILabel!
    @IBOutlet weak var dateOfEventLabel: UILabel!
   
    override func viewDidLoad() {
        attending = currentUser.goingEventIDs.contains(eventID)
        nameOfEvent.text = name
        dateOfEventLabel.text = date
        locationOfEventLabel.text = location
        descriptionOfEventLabel.text = details
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
