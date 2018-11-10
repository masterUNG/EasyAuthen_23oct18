//
//  MyConstant.swift
//  EasyAuthen__23oct18
//
//  Created by MasterUNG on 10/11/2561 BE.
//  Copyright © 2561 MasterUNG. All rights reserved.
//

import Foundation

class MyConstant {
    
    let titleHaveSpaceString: String = "มีช่องว่าง"
    let messageHaveSpaceString: String = "Please Fill Every Blank"
    let preUrlString: String = "https://www.androidthai.in.th/kan/addUserMaster.php?isAdd=true&Name="
    let columnUserString: String = "&User="
    let columnPasswordString: String = "&Password="
    
    
    func findUrlAddUser(nameString: String, userString: String, passwordString: String) -> String {
        
        let resultString: String = preUrlString + nameString + columnUserString + userString + columnPasswordString + passwordString
        
        return resultString
    }   // findUrlAddUser
    
    
    
    
    
}   // MyConstant Class
