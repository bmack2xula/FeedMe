
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
        
        //let dob = dobFormat(dateofBirth: dobString!)

        FIRAuth.auth()?.createUser(withEmail: email!, password: password!) { (user, error) in
            if error != nil {
                
                var errorMessage = "Sign Up failed :: Please try again"
                
                let error = error as! NSError
                
                if let parseError = error.userInfo["error"] as? String {
                    
                    errorMessage = parseError
                }
                
                print(errorMessage)
                
            } else {
                self.ref.child("UserProfile").child(user!.uid).setValue([
                    "firstname" : firstname!,
                    "lastname" : lastname!,
                    "dob" : dobString!
                     ])
                
                   
                
                print("Sign Up!")
            }
        }

        
        
    }
    
    func dobFormat(dateofBirth: String) -> Date {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        let date = formatter.date(from: dateofBirth)
        return date!
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

