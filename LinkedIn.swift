//
//  LinkedIn.swift
//  XRentY
//
//  Created by user on 09/10/18.
//  Copyright © 2018 Softprodigy. All rights reserved.
//

import Foundation

class LinkedIn {
    
    // logged in method 
    class func loggedIn(_ target: UIViewController, completion:@escaping ([String:Any])->()) {
        
        let permissions = [LISDK_BASIC_PROFILE_PERMISSION,LISDK_EMAILADDRESS_PERMISSION]
        LISDKSessionManager.createSession(withAuth: permissions, state: nil, showGoToAppStoreDialog: true, successBlock: { (token) in
            print(token)
            let request = LINKEDIN_API_URL + "emailAddress?q=members&projection=(elements*(handle~))"
            
            LISDKAPIHelper.sharedInstance().getRequest(request, success: { (response) in
                
                let data = response!.data.data(using: .utf8)
                if let result = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String:AnyObject] {
                    
                    var query : [String:Any] = [:]
                    query["unique_id"] = result?["id"]
                    query["first_name"] = result?["firstName"]
                    query["last_name"] = result?["lastName"]
                    query["email"] = result?["emailAddress"]
                    
                    completion(query)
                }
            }) { (error) in
                print(error?.localizedDescription ?? "")
            }
            
        }) { (error) in
            print(error?.localizedDescription ?? "")
        }
    }
}

