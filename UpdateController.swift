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
    
    @IBOutlet weak var deleteButton: UIButton!

    /*
    @IBAction func updateUserInfo(_ sender: AnyObject) {
        
        
        updateField(textField: firstnameField, fieldName: "firstname")
        updateField(textField: lastnameField, fieldName: "lastname")
        updateField(textField: dobField, fieldName: "dob")
    
        
        
    }
    */
    
    
    
    //updates profile
    func updateField(textField: UITextField, fieldName: String) {
      
    
    }
    
    
    //deletes profile and segues back to the Sign Up screen
    @IBAction func deleteProfile(_ sender: Any) {
        let user = FIRAuth.auth()?.currentUser

        user?.delete()
        
        self.performSegue(withIdentifier: "showSignupViewController", sender: self)
    
    }
    
    
    
    
    
    
    func displayAlert(title: String, message: String) {
        
        let alertcontroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertcontroller.addAction(UIAlertAction(title: "Nothing Changed", style: .default, handler: nil))
        
        self.present(alertcontroller, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ref = FIRDatabase.database().reference()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
