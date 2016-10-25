//
//  SignUpViewController.swift
//  PasswordRecovery
//
//  Created by Patrice white on 10/24/16.
//  Copyright © 2016 Patrice white. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTestField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    let networkingService = NetworkingService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signUpAction(_ sender: AnyObject) {
        networkingService.signUp(email: emailTextField.text!, username: usernameTextField.text!, password: passwordTestField.text!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
