//
//  NewReviewViewController.swift
//  WriteAReview
//
//  Created by Patrice white on 11/1/16.
//  Copyright © 2016 Patrice white. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class NewReviewViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var newReviewTextView: UITextView!
    
    var databaseRef = FIRDatabase.database().reference()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        newReviewTextView.textContainerInset = UIEdgeInsetsMake(30,20, 20, 20)
        newReviewTextView.text = "What's Happening?"
        newReviewTextView.textColor = UIColor.lightGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if(newReviewTextView.textColor == UIColor.lightGray){
            newReviewTextView.text = ""
            newReviewTextView.textColor = UIColor.black
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    @IBAction func didTapPostIt(_ sender: Any) {
        if(newReviewTextView.text.characters.count>0)
        {

            let user = FIRAuth.auth()?.currentUser
            let key = self.databaseRef.child("reviews").childByAutoId().key
            
            let childUpdates = ["/reviews/\(user?.uid)/\(key)/text":newReviewTextView.text,
                                "/reviews/\(user?.uid)/\(key)/timestamp":"\(NSDate().timeIntervalSince1970)"] as [String : Any]
            
            self.databaseRef.updateChildValues(childUpdates)
            
            dismiss(animated: true, completion: nil)
            
        }
    }

    }
    


