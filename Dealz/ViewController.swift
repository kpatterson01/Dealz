//
//  ViewController.swift
//  Dealz
//
//  Created by Kayla Patterson on 4/8/21.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var logIn: UIButton!
    
    @IBOutlet weak var signUp: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        logIn.layer.cornerRadius = 30
        signUp.layer.cornerRadius = 30
        Styling.styleButton(signUp)
        self.errorLabel.alpha = 0
        
    }
    
   // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //    <#code#>
   // }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        
        //create clean version of data
        let email = emailTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            if error != nil {
                //user could not sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            } else {
                let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    


}

