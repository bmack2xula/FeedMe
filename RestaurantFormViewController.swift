//
//  RestaurantFormViewController.swift
//  Resturant_Profile
//
//  Created by Patrice white on 11/14/16.
//  Copyright © 2016 Patrice white. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class RestaurantFormViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var hoursTextField: UITextField!
    
    
    var dbRef: FIRDatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapFinish(_ sender: Any) {
        let name = nameTextField.text
        dbRef.child("places").child(name!).observeSingleEvent(of: .value, with: { (snapshot) in
        //let address = self.addressTextField.text
        //let phone = self.phoneTextField.text
        //let hours = self.hoursTextField.text
        
        
        self.newRestaurant(name: name!, address: self.addressTextField.text!, phone: self.phoneTextField.text!, hours: self.hoursTextField.text!)
        _ = self.navigationController?.popViewController(animated: true)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func newRestaurant(name: String, address: String, phone: String, hours: String){
        let key = dbRef.child("restaurants").childByAutoId().key
        let restaurant = ["name": name, "address": address,"phone": phone, "hours": hours]
        let childUpdates = ["/restaurants/\(key)": restaurant,
                            "/each-restaurant/\(name)/\(key)/": restaurant]
        dbRef.updateChildValues(childUpdates)
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
