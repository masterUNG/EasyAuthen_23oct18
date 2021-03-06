//
//  SignUpViewController.swift
//  EasyAuthen__23oct18
//
//  Created by MasterUNG on 23/10/2561 BE.
//  Copyright © 2561 MasterUNG. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    //    Explicit
    var nameString: String?
    var userString: String?
    var passwordString: String?
    var myConstant = MyConstant()
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func cloudUpLoadButton(_ sender: Any) {
        
        nameString = nameTextField.text
        print("nameString ==> \(String(describing: nameString))")
        let myNameString: String = nameString!
        print("myNameString ==> \(myNameString)")
        
        userString = userTextField.text
        let myUserString: String = userString!
        print("myUserString ==> \(myUserString)")
        
        passwordString = passwordTextField.text
        let myPasswordString: String = passwordString!
        print("myPasswordString ==> \(myPasswordString)")
        
        if checkSpace(nameString: myNameString, userString: myUserString, passwordString: myPasswordString) {
            myAlert(titleString: myConstant.titleHaveSpaceString, messageString: myConstant.messageHaveSpaceString)
        } else {
//            Upload To Server
            uploadToServer(nameString: myNameString, userString: myUserString, passwordString: myPasswordString)
        }
        
    }   // cloudUpLoad Function
    
    func uploadToServer(nameString: String, userString: String, passwordString: String) -> Void {
        
        let urlString: String = myConstant.findUrlAddUser(nameString: nameString, userString: userString, passwordString: passwordString)
        print("urlString ==> \(urlString)")
        
        let urlPHP = URL(string: urlString)
        let request = NSMutableURLRequest(url: urlPHP!)
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            if (error != nil) {
                print("Cannot Upload")
            } else {
                
                if let myReadData = data {
                    
                    let canReadAbleData = NSString(data: myReadData, encoding: String.Encoding.utf8.rawValue)
                    print("canReadAbleData ==> \(String(describing: canReadAbleData))")
                    
                    let resultString: String = canReadAbleData! as String
                    print("resultStrin ==> \(resultString)")
                    
//                    Check Result
                    if (Bool(resultString)!) {
//                        Back To Main
                        
                        DispatchQueue.main.async {
                            self.backToMain()
                        }
                        
                    } else {
                        DispatchQueue.main.async {
                            self.myAlert(titleString: "Cannot to Upload", messageString: "Please Try Again")
                        }
                    }
                    
                }   // if2
            }   // if1
        }   // task
        task.resume()
        
    }   // uploadToServer
    
    func backToMain() -> Void {
        performSegue(withIdentifier: "BackToMain", sender: self)
    }
    
    
    
    func myAlert(titleString: String, messageString: String) -> Void {
        
        let alertController = UIAlertController(title: titleString, message: messageString, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    func checkSpace(nameString: String, userString: String, passwordString: String) -> Bool {
        
        var resultBol: Bool = false
        
        if (nameString.count == 0) || (userString.count == 0) || (passwordString == "") {
            resultBol = true
        }
        print("resultBol ==> \(resultBol)")
        return resultBol
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}
