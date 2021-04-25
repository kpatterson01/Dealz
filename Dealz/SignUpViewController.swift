//
//  SignUpViewController.swift
//  Dealz
//
//  Created by Kayla Patterson on 4/10/21.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var emailAddress: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        signUpBtn.layer.cornerRadius = 30
        errorLabel.alpha = 0
    
        
    }
    
    //Check fields and validate
    func validateFields () -> String? {
        //Check that all fields are filled in
        if firstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == " " ||
            lastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == " " ||
            emailAddress.text?.trimmingCharacters(in: .whitespacesAndNewlines) == " " ||
            password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == " " {
            
            return "Please fill in all fields."
        }
        
        //Check if the password is secure
        let checkPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if isPasswordValid(checkPassword) == false {
            return "Please make sure your password is at least 8 characters, contains a special character and an number."
        }
        
        return nil
    }
    
    //regular expression --> validates password
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        let error = validateFields()
        
        if error != nil {
            //Something is wrong with the fields
            showError(error!)
            
        } else {
            //create cleaned version
            let firstNameTxt = firstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastNameTxt = lastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let emailTxt = emailAddress.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let passwordTxt = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //Create user using FirebaseAuth
            Auth.auth().createUser(withEmail: emailTxt, password: passwordTxt) { (result, err) in
                //check for errors
                if err != nil {
                    self.showError("Error creating user")
                } else {
                    //user was created successfully, store first name and lastname
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstname": firstNameTxt, "lastname": lastNameTxt, "uid": result!.user.uid]) { (error) in
                        
                        if error != nil {
                            //show error message
                            self.showError("Error saving user data")
                        }
                    }
                    //Transition to home page of Dealz
                    self.transitionToHome()
                    
                }
            }
            
        }
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
        let storyboard = UIStoryboard(name: "HomeVC", bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "HomeVC")
            view.window?.rootViewController = initialViewController
    }
    

    

}
