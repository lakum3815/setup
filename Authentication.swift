//
//  Authentication.swift
//  XRentY
//
//  Created by user on 11/09/18.
//  Copyright © 2018 softprodigy. All rights reserved.
//

import Foundation

class Authentication: NSObject {
    
    // token
    class var token: String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "token")
        } get {
            return UserDefaults.standard.value(forKey: "token") as? String ?? nil
        }
    }
    
    // token
    class var currencySymbol: String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "currencySymbol")
        } get {
            return UserDefaults.standard.value(forKey: "currencySymbol") as? String 
        }
    }
    
    // currency
    class var currency: String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "currency")
        } get {
            return UserDefaults.standard.value(forKey: "currency") as? String ?? nil
        }
    }
    
    // token
    class var LicenceDetail: Bool? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "customerLicenceDetail")
        } get {
            return UserDefaults.standard.value(forKey: "customerLicenceDetail") as? Bool ?? false
        }
    }

    
    // badge
    class var badge: Int? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "badge")
        } get {
            return UserDefaults.standard.value(forKey: "badge") as? Int ?? 0
        }
    }
    
    // isSeller
    class var isSeller: Bool {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "isseller")
        } get {
            return UserDefaults.standard.value(forKey: "isseller") as? Bool ?? false
        }
    }
    
    // isSeller
    class var firstTime: Bool {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "firstTime")
        } get {
            return UserDefaults.standard.value(forKey: "firstTime") as? Bool ?? true
        }
    }
    
    // isSeller
    class var isEmailEditable: Bool {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "isEmailEditable")
        } get {
            return UserDefaults.standard.value(forKey: "isEmailEditable") as? Bool ?? false
        }
    }
    
    // car registration
    class var registrationName: Bool {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "registrationdoc")
        } get {
            return UserDefaults.standard.value(forKey: "registrationdoc") as? Bool ?? false
        }
    }
    
    // car registration
    class var policyName: Bool {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "policydoc")
        } get {
            return UserDefaults.standard.value(forKey: "policydoc") as? Bool ?? false
        }
    }
    
    // car drive
    class var driveIdName: Bool {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "driveId")
        } get {
            return UserDefaults.standard.value(forKey: "driveId") as? Bool ?? false
        }
    }

    // isSeller
    class var isedit: Bool {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "isedit")
        } get {
            return UserDefaults.standard.value(forKey: "isedit") as? Bool ?? false
        }
    }
    
    // isSeller
    class var isfile: Bool {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "isfile")
        } get {
            return UserDefaults.standard.value(forKey: "isfile") as? Bool ?? false
        }
    }
    
    // is user logged in
    class var isUserLoggedIn: Bool? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "login")
        } get {
            return UserDefaults.standard.bool(forKey: "login")
        }
    }
    
    // is user logged in
    class var appMode: Bool? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "mode")
        } get {
            return UserDefaults.standard.bool(forKey: "mode")
        }
    }
    
    // customer name
    class var customerName: String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "name")
        } get {
            return UserDefaults.standard.value(forKey: "name") as? String ?? nil
        }
    }
    
    // customer start date
    class var startDate: String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "start_date")
        } get {
            return UserDefaults.standard.value(forKey: "start_date") as? String ?? nil
        }
    }
    
    // customer end date
    class var endDate: String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "end_date")
        } get {
            return UserDefaults.standard.value(forKey: "end_date") as? String ?? nil
        }
    }
    
    // customer device Token
    class var deviceToken: String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "device_token")
        } get {
            return UserDefaults.standard.value(forKey: "device_token") as? String ?? nil
        }
    }
    
    // customer name
    class var customerImage: String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "image")
        } get {
            return UserDefaults.standard.value(forKey: "image") as? String ?? nil
        }
    }
    
    // clabe account detail
    class var clabeAccountDetail: Int? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "clabeAccountDetail")
        } get {
            return UserDefaults.standard.value(forKey: "clabeAccountDetail") as? Int ?? 0
        }
    }
    
    // customer id
    class var customerId: String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "id")
        } get {
            return UserDefaults.standard.value(forKey: "id") as? String ?? nil
        }
    }
    
    // User id
    class var userId: String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "userId")
        } get {
            return UserDefaults.standard.value(forKey: "userId") as? String ?? nil
        }
    }
    
    // appVersion
    class var appVersion: String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "appVersion")
        } get {
            return UserDefaults.standard.value(forKey: "appVersion") as? String ?? nil
        }
    }
    
    // customer id
    class var openpayCustomerId: String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "openpayid")
        } get {
            return UserDefaults.standard.value(forKey: "openpayid") as? String ?? nil
        }
    }
    
    // quote id
    class var quoteId: String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "quote_id")
        } get {
            return UserDefaults.standard.value(forKey: "quote_id") as? String ?? nil
        }
    }
    
    // quote id
    class var quoteCount: String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "quote_count")
        } get {
            return UserDefaults.standard.value(forKey: "quote_count") as? String ?? nil
        }
    }
    
    // ram Id
    class var rmaId: String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "rma_id")
        } get {
            return UserDefaults.standard.value(forKey: "rma_id") as? String ?? nil
        }
    }
    
    // authenticate user
    class func autheticateUser(_ user: User) {
        
        try? LTCoordinator.sharedInstance().enableServices(on: user.id)
        
        isUserLoggedIn = true
        customerId = user.id
        quoteId = user.quoteId
        quoteCount = user.quoteCount
        token = user.token
        clabeAccountDetail = user.clabeAccount
        isSeller = user.isSeller == 1
        appMode = user.isSeller == 0
        LicenceDetail = user.customerLicenceDetail
    }
    
    // authenticate user
    class func clearData() {

        isUserLoggedIn = false
        customerId = nil
        quoteId = nil
        quoteCount = nil
        token = nil
        isSeller = false
        openpayCustomerId = nil
        clabeAccountDetail = nil
        LicenceDetail = nil
        Authentication.firstTime = true
        currency = nil
        currencySymbol = nil
        LTCoordinator.sharedInstance().disableServices()
    }
}
