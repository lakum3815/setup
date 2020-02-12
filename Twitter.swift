//
//  TwitterLogin.swift
//  XRentY
//
//  Created by user on 27/06/18.
//  Copyright © 2019 Softprodigy. All rights reserved.
//

import Foundation
import TwitterKit

class Twitter {
    
    // login
    class func loginUser(completion: @escaping ([String:Any])->Void) {
        
        logoutUser() // logout user if already login
        
        TWTRTwitter.sharedInstance().logIn { (session, error) in
            DispatchQueue.main.async {
                if (session != nil) {
                    var query : [String:Any] = [:]
                    query["unique_id"] = session!.userID
                    self.fetchUserInfo(session!, completion: { (result) in
                        result.forEach {
                            query[$0] = $1
                        }
                        self.fetchEmail(session!, completion: { (result) in
                            result.forEach {
                                query[$0] = $1
                                completion(query)
                            }
                        })
                    })
                } else {
                    print("error: \(String(describing: error?.localizedDescription))")
                }
            }
        }
    }
    
    // fetch user info
    private class func fetchUserInfo(_ session: TWTRSession, completion:@escaping ([String:Any])->()) {
       
        TWTRAPIClient().loadUser(withID: session.userID, completion: { (user, error) in
            print("user's name: \(user?.name ?? "")")
            guard let name = user?.name else {
                completion([:])
                return
            }
            var query: [String:Any] = [:]
            let arrName = name.components(separatedBy: " ")
            if arrName.count > 0 {
                query["first_name"] = arrName[0]
                query["last_name"] = arrName.count > 1 ? arrName[1] : ""
            } else {
                query["first_name"] = session.userName
                query["last_name"] = ""
            }
            completion(query)
        })
    }
    
    // fetch user email
    private class func fetchEmail(_ session: TWTRAuthSession, completion:@escaping ([String:Any])->()) {
        
        // fetch user email
        TWTRAPIClient(userID: session.userID).requestEmail(forCurrentUser: { (email, error) in
            let query: [String:Any] = ["email" : email ?? ""]
            completion(query)
        })
    }
    
    // logout
    private class func logoutUser() {
        let sessionStore = TWTRTwitter.sharedInstance().sessionStore
        if let userID = sessionStore.session()?.userID {
            sessionStore.logOutUserID(userID)
        }
    }
}
