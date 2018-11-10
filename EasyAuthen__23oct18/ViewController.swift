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
    var myConstant = MyConstant()
    
    
    

    
    @IBOutlet weak var userTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBAction func signInButton(_ sender: Any) {
        
//        Get Value From TextField
        userString = userTextField.text!
        passwordString = passwordTextField.text!
        
//        Show Log
        print("user ==> \(userString)   password ==> \(passwordString)")
        
        if (userString.count == 0) || (passwordString.count == 0) {
            myAlert(titleString: myConstant.titleHaveSpaceString, messageString: myConstant.messageHaveSpaceString)
        }   else {
            checkUserAnPass()
        }
        
    }   // signIn Function
    
    func checkUserAnPass() -> Void {
        
        let urlString = myConstant.findUrlGetUser(userString: userString)
        let urlJSON = URL(string: urlString)
        let request = NSMutableURLRequest(url: urlJSON!)
        let myTask = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            if (error != nil) {
                print("Error")
            } else {
                
                if let readAbleData = data {
                    let canReadAbleData = NSString(data: readAbleData, encoding: String.Encoding.utf8.rawValue)
                    
                    let jsonString: String = canReadAbleData! as String
                    print("jsonString ==> \(jsonString)")
                    
//                    Split Prifix
                    let blockPrefix = "["
                    
                    let contentArray1 = jsonString.components(separatedBy: blockPrefix)
                    print("contentArray1[1] ==> \(contentArray1[1])")
                    
                    let blockSubfix = "]"
                    let contentArray2 = contentArray1[1].components(separatedBy: blockSubfix)
                    print("contentArray2[0] ==> \(contentArray2[0])")
                    
                    self.convertJSONtoDictionary(jsonString: contentArray2[0])
                    
                }   // if2
            }    //if1
        }   // myTask
        myTask.resume()
    }   // checkUserAnPass
    
    func convertJSONtoDictionary(jsonString: String) -> Void {
        
        var dictionary: NSDictionary?
        
        if let data = jsonString.data(using: String.Encoding.utf8) {
            
            do {
                
                dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
                
                if let myDictionary = dictionary {
                      print("myDic ==> \(myDictionary)")
                    checkPassword(passwordString: myDictionary["Password"] as! String, nameString: myDictionary["Name"] as! String)
                }   // if
                
            }   // do
            catch let error as NSError {
                print("Error ==> \(error)")
            }   // catch
            
        }   // if1
    }   // convertJSON
    
    func checkPassword(passwordString: String, nameString: String) -> Void {
        
        
    
    }   //  check
    
    
    
    func myAlert(titleString: String, messageString: String) -> Void {
        
        let alertController = UIAlertController(title: titleString, message: messageString, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

