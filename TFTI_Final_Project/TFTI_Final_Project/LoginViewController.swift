//
//  LoginViewController.swift
//  TFTI_Final_Project
//
//  Created by Sahana Srinivasan on 4/24/17.
//  Copyright © 2017 Sahana Srinivasan. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        print("entered login view")
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        // Checks if user is already signed in and skips login
        //if FIRAuth.auth()?.currentUser != nil {
         //   print("already logged in")
          //  self.performSegue(withIdentifier: "login-signup", sender: self)
        //}
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    /*
     TODO:
     
     Implement login functionality using the Firebase Auth function for signing in.
     You should check the result of the function call to see if it completes without error.
     If an error occurs, display a message using a UIAlertController (e.g. "Sign in failed, try again")
     Otherwise, perform a segue to the rest of the app using the identifier "loginToMain"
     
     */
    @IBAction func didAttemptLogin(_ sender: UIButton) {
        guard let emailText = emailField.text else { return }
        guard let passwordText = passwordField.text else { return }
        
        FIRAuth.auth()?.signIn(withEmail: emailText, password: passwordText, completion: {
            (user, error) in
            if let error = error {
                let alert: UIAlertController = UIAlertController(title: "Error!", message: "Could not login", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: { action in
                    switch action.style{
                    default:
                        self.navigationController?.popViewController(animated: true)
                        return
                    }
                }))
                self.present(alert, animated: true, completion: nil)
            }
            else {
                print("segue to main")
                self.performSegue(withIdentifier: "loginToMain", sender: self)
            }
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
