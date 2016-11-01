
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
    
    
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference(withPath: "user")
        
    }
    
    
    
    @IBAction func signupAction(_ sender: AnyObject) {
        
        let firstname = firstnameField.text
        let lastname = lastnameField.text
        let dob = dobFormat(dateofBirth: dobField.text!)
        
        let email = emailField.text
        let password = passwordField.text
        let passwordcomf = authpasswordField.text
        
        
        
        let passwordComfirmation = confirmPassword(password1: password!, password2: passwordcomf!)
        
        
        FIRAuth.auth()?.createUser(withEmail: email!, password: password!) { (user, error) in
            
            if (firstname?.isEmpty)! || (lastname?.isEmpty)! || (dob == "") || (email?.isEmpty)! || (password?.isEmpty)! || (passwordcomf?.isEmpty)! {
                
                
                self.displayAlert(title: "Sign Up Failed :: Please try again", message: "Please complete all sign up fields")
                
            }else if error != nil || (passwordComfirmation == false){
                
                var errorMessage = "Sign Up Failed :: Please try again"

                let error = error as! NSError
                
                if let parseError = error.userInfo["error"] as? String {
                    
                    errorMessage = parseError
                }
                print(errorMessage)
                
                self.displayAlert(title: "Sign Up Failed", message: "Passwords do not match please try again")
                
                
            } else{
                
                self.ref.child("User Profile Information").child(user!.uid).setValue([
                    "firstname" : firstname!,
                    "lastname" : lastname!,
                    "dob" : dob
                    ])
                //self.ref.child("User Profile Information").child(user!.uid).setValue(["dob": dob])
                
                
                
                
                
                self.performSegue(withIdentifier: "showLoginViewController", sender: self)
                
                
                
            }
        }
        
        
        
    }
    
    //Converts a string -> date -> string
    func dobFormat(dateofBirth: String) -> String {
        if dateofBirth.isEmpty {
            return ""
        } else{
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd-yy"
            let date = formatter.date(from: dateofBirth)
            
            let dob = formatter.string(from: date!)
            
            return dob
    }
    }
    
    //Error alert message
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
    
    //segue button
    @IBAction func loginPage(_ sender: AnyObject) {
        
        self.performSegue(withIdentifier: "showLoginViewController", sender: self)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

