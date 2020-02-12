//
//  FacebookManager.swift
//  Chnen
//
//  Created by user on 14/05/18.
//  Copyright © 2018 navjot_sharma. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class Facebook: NSObject {
    
    typealias ResultHandler = ((_ result: [String:Any]) -> Void)
    var completion : ResultHandler? = nil
    static let sharedInstance = Facebook()
    
    override init() {
        // initialization
    }
    
    // Login Facebook
    static func login(target:UIViewController, completion: ResultHandler?) {
        
        sharedInstance.completion = completion
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: target) { (result, error) in
            if (error == nil) {
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email")) {
                        Facebook.fetchUserDetails()
                        fbLoginManager.logOut()
                    }
                }
            } else {
                sharedInstance.completion = nil
            }
        }
    }
    
    // Facebook Login API
    static func fetchUserDetails() {
        
        if((FBSDKAccessToken.current()) != nil) {
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name,gender,picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                guard error == nil, let json = result as? [String:Any] else {
                    sharedInstance.completion = nil
                    return
                }
                sharedInstance.completion!(json)
            })
        }
    }
}
