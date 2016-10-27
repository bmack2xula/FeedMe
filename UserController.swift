//
//  UserController.swift
//  Feedme
//
//  Created by Brittney Mack on 10/26/16.
//  Copyright © 2016 Brittney Mack. All rights reserved.
//

import UIKit
import Firebase



class UserController: UIViewController, UIImagePickerControllerDelegate,  UINavigationControllerDelegate{
    
    
    var ref: FIRDatabaseReference!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var imageButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
    }
    
    @IBAction func updateProfile(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "showUpdateController", sender: self)
    }
    
    @IBAction func deleteProfile(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "showDeleteController", sender: self)
    }
    
    @IBAction func imageProfile(_ sender: AnyObject) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum){
            print("Button capture")
            
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        } else{
            print("Something went wrong :: Please try again")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
