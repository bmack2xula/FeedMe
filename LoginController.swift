//
//  LoginController.swift
//  Feedme
//
//  Created by Brittney Mack on 10/26/16.
//  Copyright © 2016 Brittney Mack. All rights reserved.
//


import UIKit
import Firebase

class LoginController: UIViewController {
 
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    var ref: FIRDatabaseReference!
    
    @IBAction func login(_ sender: AnyObject) {
        let email = emailField.text
        let password = passwordField.text
        
        FIRAuth.auth()?.signIn(withEmail: email!, password: password!, completion: { (user, error) in
            if error != nil{
                var errorMessage = "Login Failed :: Please try again"
                
                let error = error as! NSError
                
                if let parseError = error.userInfo["error"] as? String {
                    
                    errorMessage = parseError
                    
                }
                print(errorMessage)
                 self.displayAlert(title: "Login Failed", message: "Please try again")
                
            }else {
                
                print("Logged in!")
                
                self.performSegue(withIdentifier: "UserPageViewController", sender: self)
                
                
            }
        })
    }
    
    func displayAlert(title: String, message: String) {
        
        let alertcontroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertcontroller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alertcontroller, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference(withPath: "user")
        
    }
    
    @IBAction func signupPage(_ sender: Any) {
        
        self.performSegue(withIdentifier: "SignUpViewController", sender: self)
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
 
