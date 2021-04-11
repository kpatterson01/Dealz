//
//  Styling.swift
//  Dealz
//
//  Created by Kayla Patterson on 4/11/21.
//

import Foundation
import UIKit

class Styling {
    
    static func styleTextField(_ textfield: UITextField) {
        textfield.layer.borderColor = UIColor.blue.cgColor
        textfield.layer.borderWidth = 1.0
        
    }
    
    static func styleButton(_ button: UIButton) {
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.tintColor = UIColor.black
        button.layer.backgroundColor = UIColor.white.cgColor
        
    }
}
