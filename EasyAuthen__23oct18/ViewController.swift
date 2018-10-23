//
//  ViewController.swift
//  EasyAuthen__23oct18
//
//  Created by MasterUNG on 23/10/2561 BE.
//  Copyright © 2561 MasterUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    Explicit
    var userString: String = ""
    var passwordString: String = ""
    
    
    

    
    @IBOutlet weak var userTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBAction func signInButton(_ sender: Any) {
        
//        Get Value From TextField
        userString = userTextField.text!
        passwordString = passwordTextField.text!
        
//        Show Log
        print("user ==> \(userString)   password ==> \(passwordString)")
        
        
    }   // signIn Function
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

