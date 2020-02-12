//
//  SocialLogin.swift
//  XRentY
//
//  Created by user on 08/10/18.
//  Copyright © 2018 Softprodigy. All rights reserved.
//

import Foundation

enum SocialLogin {
    
    case facebook([String:Any])
    case twitter([String:Any])
    case linkedIn([String:Any])
    
    var query: [String:Any] {
        var parameters: [String:Any] = [:]
        switch self {
        case .facebook(let result):
            parameters["fb_unique_id"] = result["id"] ?? ""
            parameters["twitter_unique_id"] = ""
            parameters["lk_unique_id"] = ""
            parameters["login_type"] = "facebook"
            parameters["first_name"] =  result["first_name"] ?? ""
            parameters["last_name"] =  result["last_name"] ?? ""
            parameters["email"] =  result["email"] ?? ""
        case .twitter(let result):
            parameters["twitter_unique_id"] = result["unique_id"] ?? ""
            parameters["fb_unique_id"] = ""
            parameters["lk_unique_id"] = ""
            parameters["login_type"] = "twitter"
            parameters["first_name"] =  result["first_name"] ?? ""
            parameters["last_name"] =  result["last_name"] ?? ""
            parameters["email"] =  result["email"] ?? ""
        case .linkedIn(let result):
            parameters["lk_unique_id"] = result["unique_id"] ?? ""
            parameters["twitter_unique_id"] = ""
            parameters["fb_unique_id"] = ""
            parameters["login_type"] = "linkedin"
            parameters["first_name"] =  result["first_name"] ?? ""
            parameters["last_name"] =  result["last_name"] ?? ""
            parameters["email"] =  result["email"] ?? ""
        }
        return parameters
    }
    
    var uniqueId : String {
        switch self {
        case .facebook(_):
            return query["fb_unique_id"] as? String ?? ""
        case .twitter(_):
            return query["twitter_unique_id"] as? String ?? ""
        case .linkedIn(_):
            return query["lk_unique_id"] as? String ?? ""
        }
    }
}
