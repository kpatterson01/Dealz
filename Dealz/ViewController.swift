//
//  ViewController.swift
//  Dealz
//
//  Created by Kayla Patterson on 4/8/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var logIn: UIButton!
    
    @IBOutlet weak var signUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        logIn.layer.cornerRadius = 30
        signUp.layer.cornerRadius = 30
        Styling.styleButton(signUp)
        
    }
    
   // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //    <#code#>
   // }


}

