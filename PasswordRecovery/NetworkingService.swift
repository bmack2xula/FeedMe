//
//  NetworkingService.swift
//  PasswordRecovery
//
//  Created by Patrice white on 10/24/16.
//  Copyright © 2016 Patrice white. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

struct NetworkingService{
    
    let databaseRef = FIRDatabase.database().reference()
    let storageRef = FIRStorage.storage().reference()
    
    private func saveInfo(user: FIRUser!, username: String, password: String){
        
        // create user dictionary
        
        let userInfo = ["email": user.email, "username": username, "userID": user.uid]
        
        // create user reference
        
        let userRef = databaseRef.child("users").child(user.uid)
        
        // save info in database

        userRef.setValue(userInfo)
        
        signIn(email: user.email!, password: password)
    }
    
    func signIn(email: String, password: String){
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if error == nil{
                
                if let user = user  {
                    print("\(user.displayName) has signed in successfully!")
                }
            } else{
                print(error?.localizedDescription)
            }
        })
        
    }
    
    func setUserInfo(user: FIRUser!, username: String, password: String){
        
        let changeRequest = user.profileChangeRequest()
        changeRequest.displayName = username
        
        self.saveInfo(user: user, username: username, password: password)
        
    }
    
    func signUp(email: String, username: String, password: String){
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            
            if error == nil {
                self.setUserInfo(user: user, username: username, password: password)
            }
            else{
                print (error?.localizedDescription)
            }
        })
        
    }
    
}
