//
//  UpdateController.swift
//  Feedme
//
//  Created by Brittney Mack on 10/26/16.
//  Copyright © 2016 Brittney Mack. All rights reserved.
//

import UIKit
import Firebase

class UpdateController: UIViewController {
    
    var ref: FIRDatabaseReference!

    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBOutlet weak var dobField: UITextField!
    
    //deletes profile and segues back to the Sign Up screen
    @IBAction func deleteProfile(_ sender: Any) {
        let user = FIRAuth.auth()?.currentUser
        
        user?.delete()
        
        self.performSegue(withIdentifier: "SignupViewController", sender: self)
    }
  
    
    //brings you back to the user profile
    @IBAction func cancelAction(_ sender: Any) {
    
        self.performSegue(withIdentifier: "UserPageViewController", sender: self)
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    
    
    
    func updateInformation() {
        let key = FIRDatabase.database().reference().child("user")
        
        key.updateChildValues([
            "firstname": firstnameField.text!,
            "lastname": lastnameField.text!,
            "dob": dobField.text! ])
        
       //let childUpdates = ["/information/\(key)": information, "/user-information/\(firstnameField.text)/\(key)/": information]
    }
    

    @IBAction func updateButton(_ sender: Any) {
        updateInformation()
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    func displayAlert(title: String, message: String) {
        
        let alertcontroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertcontroller.addAction(UIAlertAction(title: "Nothing Changed", style: .default, handler: nil))
        
        self.present(alertcontroller, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
