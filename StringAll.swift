//
//  StringAll.swift
//  TheChangeRoom
//
//  Created by lakum vishal on 03/01/19.
//  Copyright © 2019 lakum vishalbhai rajeshbhai. All rights reserved.
//

import Foundation

struct AlertMsg
{
    static let TITLE                = ""
    static let MEDIA_PERMITION      = "Go to setting and give permission to The Change Room app for media access"
    static let OS_ERROR             = "update your os to use this feature"
    static let INVALID_USER         = "invalid user name or password"
    static let ENTER_OLD_PASSWORD   = "Please enter old password"
    static let ENTER_NEW_PASSWORD   = "Please enter new password"
    static let CONFIRM_PASSWORD     = "Please enter confirm password"
    static let PASSWORD_DO_NOT_MATCH = "Password do not match"

    static let INTERNET_OFFLINE = "The internet connection appears to be offline."

    //login
    
    static let ENTER_USER_NAME      = "Please enter user name"
    static let ENTER_PASSWORD       = "Please enter password"
    static let SELECT_COMPANY       = "Please select company"

    //Add PopUp
    
    static let ENTER_BATCH          = "Please enter Batch number"
    static let ENTER_SERIAL         = "Please enter Serial number"
    static let ENTER_BIN            = "Please enter Bin number"
    static let ENTER_EXP            = "Please enter ExpiryDate"
    static let ENTER_CNT            = "Please select count"
    static let BATCH_EXIST          = "Entered batch number already exist"
    static let SERIAL_EXIST         = "Entered serial number already exist"
    static let BIN_EXIST            = "Entered bin number already exist"

    //wherehouse selection
    
    static let SELECT_WHEREHOUSE       = "Please select WhereHouse"
    static let SELECT_SNAPSHOTID       = "Please select SnapShot"

    //static let ARE_YOU_SURE_YOU_WANT_TO_LOGOUT = "Are you sure you want Logout?"
    static let ARE_YOU_SURE_YOU_WANT_TO_LOGOUT = "Are you sure you want to log out?"
    static let NO_DATA = "No Data Avialable"
    static let SELECT_VALID_DATE = "Please select valid date"
    
    //upload
    static let NO_CHANGES   = "There is no changes to upload"
    static let UPLOAD_DATA  = "Are you sure you want to upload local changes?"

    //alert
    static let OK       = "OK"
    static let CANCEL   = "CANCEL"
    static let SURE     = "Are you sure you want to delete this item?"

}

struct whereHouseSelecton {
    static let DESC_WHEREHOUSE = "Description Of Wherehouse"
    static let DESC_SNAPSHOTID = "Description Of Snapshot"
    static let PLACE_HOLDER_WHEREHOUSE = "Wherehouse"
    static let PLACE_HOLDER_SNAPSHOTID = "Snapshot"
}

struct ActionSheetOptions {
    
    //INST3 Parent list
    static let SORT_TITLE = "Slect Sort Option"
    static let SORT = "Sort "
    static let BY_STOCK = "By Stock Code"
    static let BY_DESC = "By Description"
    static let BY_LOCATION1 = "By Location 1"
    static let BY_LOCATION2 = "By Location 2"
    static let BY_COUNT = "By Count"
    static let RESET_FILLTER = "Reset / Clear fillter"
    
    //INST3 Child list
    static let BY_SBB = "By Serial / Batch / Bin No."
    static let BY_EXP = "By Expiry Date"
}

struct ProductType {
    static let BATCH = "Batch:"
    static let SERIAL = "Serial:"
    static let BIN = "Bin:"
    
    static let PLACEHOLDER_BATCH = "Batch Number"
    static let PLACEHOLDER_SERIAL = "Serial Number"
    static let PLACEHOLDER_BIN = "Bin Number"
}
