//
//  Utility.swift
//  TheChangeRoom
//
//  Created by lakum vishal on 03/01/19.
//  Copyright © 2019 lakum vishalbhai rajeshbhai. All rights reserved.
//

import Foundation

let defaults = UserDefaults.standard

class Utility : NSObject{
    

    class func getTimeZone() -> String!{
        let SystemTimeZone = NSTimeZone.system as NSTimeZone
        return "\(SystemTimeZone)".removeAfterSpace()
    }

    //Save and Retrive URL
    class func setAPIURL(_ APIURL: String){
        defaults.set(APIURL, forKey: "API_URL")
    }
    
    class func getAPIURL() -> String!{
        if let APIURL = defaults.object(forKey: "API_URL"){
            return APIURL as? String
        }else{
            return ""
        }
    }
    
    //Save and Retrive Device Token
    class func setDeviceToken(_ dToken: String){
        defaults.set(dToken, forKey: "device_token")
    }
    
    class func getDeviceToken() -> String!{
        if let dToken = defaults.object(forKey: "device_token"){
            return dToken as? String
        }else{
            return ""
        }
    }

    //Save and Retrive Is Login
    class func setIsLogin(_ isLogin: Bool){
        defaults.set(isLogin, forKey: "isLogin")
    }
    
    class func getIsLogin() -> Bool!{
        if let isLogin = defaults.object(forKey: "isLogin"){
            return isLogin as? Bool
        }else{
            return false
        }
    }
    
    
    //Save and Retrive Is Database Ready
    class func setIsDBRedy(_ IsDBRedy: Bool){
        defaults.set(IsDBRedy, forKey: "isBDRedy")
    }
    
    class func getIsDBRedy() -> Bool!{
        if let IsDBRedy = defaults.object(forKey: "isBDRedy"){
            return IsDBRedy as? Bool
        }else{
            return false
        }
    }
    //Save and Retrive Is Database Ready
    class func setIsDBRedy2(_ IsDBRedy: Bool){
        defaults.set(IsDBRedy, forKey: "isBDRedy2")
    }
    
    class func getIsDBRedy2() -> Bool!{
        if let IsDBRedy = defaults.object(forKey: "isBDRedy2"){
            return IsDBRedy as? Bool
        }else{
            return false
        }
    }

    //Save and Retrive Is Database Ready
    class func setIsCustomerset(_ isCustomerset: Bool){
        defaults.set(isCustomerset, forKey: "isCustomerset")
    }
    
    class func getIsCustomerset() -> Bool!{
        if let isCustomerset = defaults.object(forKey: "isCustomerset"){
            return isCustomerset as? Bool
        }else{
            return false
        }
    }

    //Save and Retrive Selected Where House
    class func setWH(_ wh: String){
        defaults.set(wh, forKey: "whereHouse")
    }
    
    class func getWH() -> String!{
        if let wh = defaults.object(forKey: "whereHouse"){
            return wh as? String
        }else{
            return ""
        }
    }
    
    //Save and Retrive Selected Snapshot
    class func setSS(_ ss: String){
        defaults.set(ss, forKey: "snapShot")
    }
    
    class func getSS() -> String!{
        if let ss = defaults.object(forKey: "snapShot"){
            return ss as? String
        }else{
            return ""
        }
    }

    //Save and Retrive userName
    class func setUserName(_ userName: String){
        defaults.set(userName, forKey: "userName")
    }
    
    class func getUserName() -> String!{
        if let userName = defaults.object(forKey: "userName"){
            return userName as? String
        }else{
            return ""
        }
    }

    //Save and Retrive Profile
    class func setProfile(_ profile: String){
        defaults.set(profile, forKey: "Company_Profile")
    }
    
    class func getProfile() -> String!{
        if let profile = defaults.object(forKey: "Company_Profile"){
            return profile as? String
        }else{
            return ""
        }
    }

    //Save and Retrive Menu navigation
    class func setMenuIndex(_ ind: Int){
        defaults.set(ind, forKey: "Menu_Index")
    }
    
    class func getMenuIndex() -> Int!{
        if let profile = defaults.object(forKey: "Menu_Index"){
            return profile as? Int
        }else{
            return 0
        }
    }

    //Save and Retrive Selected Snapshot
    class func setScanValue(_ sv: String){
        defaults.set(sv, forKey: "scan_value")
    }
    
    class func getScanValue() -> String!{
        if let sv = defaults.object(forKey: "scan_value"){
            return sv as? String
        }else{
            return ""
        }
    }

    /**
     *  Show error msg in toast
     */
    class func showError(error : NSError){

        var errorText = (error.localizedDescription) as String
        
        if error.code == errorCODE.noInternet || error.code == errorCODE.connectionLost{
            errorText = "Internet connection is not available"
        }else if error.code == errorCODE.jsonParseError || error.code == errorCODE.jsonParError || error.code == errorCODE.requestTimeOut{
            errorText = "An unknown error has occured. Please try again."
        }
        AppDelegate.shared().rootViewController.showSimpleAlert("", message: errorText as String)
    }    
}



struct errorCODE
{
    static let noInternet = -1009
    static let connectionLost = -1005
    static let requestTimeOut = -1001
    static let jsonParseError = 3840
    static let jsonParError = 4
}

