//
//  CreateViewController.swift
//  TFTI_Final_Project
//
//  Created by Sahana Srinivasan on 4/24/17.
//  Copyright © 2017 Sahana Srinivasan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class CreateViewController: UIViewController {

    @IBOutlet weak var descriptionField: UITextField!
    
    @IBOutlet weak var locationField: UITextField!
   
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBAction func createPressed(_ sender: Any) {
        let format = DateFormatter()
        format.dateFormat = dateFormat
        let date = format.string(from: datePicker.date)
        
        if let eventName = nameField.text{
            if let eventLocation = locationField.text{
                if let description = descriptionField.text {
                    addEvent(name: eventName, location: eventLocation, dateOfEvent: date, username: (FIRAuth.auth()?.currentUser?.email)!, description: description)
                    performSegue(withIdentifier: "create-feed", sender: nil)
                } else {
                    let alert = UIAlertController(title: "Error!", message: "You must give a description for the event.", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            
            } else {
                let alert = UIAlertController(title: "Error!", message: "You must give a location for the event.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            let alert = UIAlertController(title: "Error!", message: "You must give a name for the event.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
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
