
import UIKit
import Firebase

class SignupController: UIViewController {
    
    
    
    //Outlets
    
    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBOutlet weak var dobField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var authpasswordField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference(withPath: "user")
        
    }
    
    
    @IBAction func signup(_ sender: AnyObject) {
        
        let firstname = firstnameField.text
        let lastname = lastnameField.text
        let dobString = dobField.text
        let email = emailField.text
        let password = passwordField.text
        let authpassword = authpasswordField.text
        
        
        
        let value = confirmPassword(password1: password!, password2: authpassword!)
        
        
        FIRAuth.auth()?.createUser(withEmail: email!, password: password!) { (user, error) in
            if error != nil || (value == false){
                
                var displayedErrorMessage = "Please try again later"
                
                let error = error as! NSError
                
                if let parseError = error.userInfo["error"] as? String {
                    
                    displayedErrorMessage = parseError
                }
                print(displayedErrorMessage)
                self.displayAlert(title: "Sign Up Failed", message: displayedErrorMessage)
                
            } else {
                self.ref.child("UserProfile").child(user!.uid).setValue([
                    "firstname" : firstname!,
                    "lastname" : lastname!,
                    "dob" : dobString!
                    ])
                
                
                self.performSegue(withIdentifier: "showLoginViewController", sender: self)
                
                
                
            }
        }
        
        
        
    }
    /*
     func dobFormat(dateofBirth: String) -> Date {
     
     let formatter = DateFormatter()
     formatter.dateFormat = "MM-dd-yyyy"
     let date = formatter.date(from: dateofBirth)
     return date!
     
     }
     */
    func displayAlert(title: String, message: String) {
        
        let alertcontroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertcontroller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alertcontroller, animated: true, completion: nil)
        
    }
    
    func confirmPassword(password1: String, password2: String) -> Bool {
        if password1 != password2 {
            return false
        } else{
            return true
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

