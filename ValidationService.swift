//
//  ValidationService.swift
//  TheChangeRoom
//
//  Created by lakum vishal on 03/01/19.
//  Copyright © 2019 lakum vishalbhai rajeshbhai. All rights reserved.
//

/// frameworks import
// MARK: - frameworks import
import UIKit
import Foundation

/// classes import
// MARK: - classes import



struct ValidationConstant {
    
    struct Regex {
        
        static let EmailValidation = "[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}" + "\\@" + "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" + "(" + "\\." + "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" + ")+"
        
        static let PhoneValidation : String! = "^((\\+)|(00)|(\\*)|())[0-9]{10,14}((\\#)|())$"

        static let UrlValidation = "http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&amp;=]*)?"
    }

    struct Numeric {
        
        static let INTEGER : String! = "0123456789"
        static let FLOAT : String! = ".0123456789"
        static let NUMERIC : String! = "0123456789@$ +!=*&"

        static let zero = 0
        static let one = 0
    }
    
    struct Text {
        
        static let ALPHA : String! = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
        static let ALPHA_NUMERIC : String! = ALPHA + Numeric.NUMERIC

        static let null1 = "<null>"
        static let null2 = "<NULL>"
        static let null3 = "(null)"
        static let null4 = "(NULL)"
        static let null5 = "null"
        static let null6 = "NULL"
        static let blank = ""
        static let space = " "
        static let newline = "\n"
    }

    
}

//***********************************************************************

// MARK: - String
extension String
{
    
    var isNull: Bool{
        let string = self.replacingOccurrences(of: " ", with: "")
        
        if (
            string.isEmpty
            || string == ValidationConstant.Text.null1
            || (string == ValidationConstant.Text.null2)
            || (string == ValidationConstant.Text.null3)
            || (string == ValidationConstant.Text.null4)
            || (string == ValidationConstant.Text.null5)
            || (string == ValidationConstant.Text.null6)
            || string.count == ValidationConstant.Numeric.zero
            || (string == ValidationConstant.Text.blank)
            || (string == ValidationConstant.Text.space)
            || (string == ValidationConstant.Text.newline)
            || string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).count == ValidationConstant.Numeric.zero
            ){
            return true
        }

        return false
    }
    
    var trim: String{
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }

    func isEqual(string: String) -> Bool{
        return self == string
    }

    func isValidLength(min: Int, max: Int) -> Bool{
        if (self.count >= min) && (self.count <= max){
            return true
        }else{
            return false
        }
    }
    
    func isValidTrimLength(min: Int, max: Int) -> Bool{
        if (self.trim.count >= min) && (self.trim.count <= max){
            return true
        }else{
            return false
        }
    }

    func occurenceCount(occurenceString: String) -> Int{
        return self.components(separatedBy: occurenceString).count - ValidationConstant.Numeric.one
    }

    func isSpaceAvailable()-> Bool{
        return self.contains(" ")
    }
    
    var isValidEmail: Bool{
        
        let inputText = self as NSString
        let emailRegex = ValidationConstant.Regex.EmailValidation
        let email = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        var aRange: NSRange
        if email.evaluate(with: inputText) {
            aRange = inputText.range(of: ".", options: .backwards, range: NSRange(location: ValidationConstant.Numeric.zero, length: inputText.length))
            let indexOfDot = aRange.location
            if aRange.location != NSNotFound {
                var topLevelDomain = inputText.substring(from: indexOfDot)
                topLevelDomain = topLevelDomain.lowercased()
                let TLD = Set([".aero", ".asia", ".biz", ".cat", ".com", ".coop", ".edu", ".gov", ".info", ".int", ".jobs", ".mil", ".mobi", ".museum", ".name", ".net", ".org", ".pro", ".tel", ".travel", ".ac", ".ad", ".ae", ".af", ".ag", ".ai", ".al", ".am", ".an", ".ao", ".aq", ".ar", ".as", ".at", ".au", ".aw", ".ax", ".az", ".ba", ".bb", ".bd", ".be", ".bf", ".bg", ".bh", ".bi", ".bj", ".bm", ".bn", ".bo", ".br", ".bs", ".bt", ".bv", ".bw", ".by", ".bz", ".ca", ".cc", ".cd", ".cf", ".cg", ".ch", ".ci", ".ck", ".cl", ".cm", ".cn", ".co", ".cr", ".cu", ".cv", ".cx", ".cy", ".cz", ".de", ".dj", ".dk", ".dm", ".do", ".dz", ".ec", ".ee", ".eg", ".er", ".es", ".et", ".eu", ".fi", ".fj", ".fk", ".fm", ".fo", ".fr", ".ga", ".gb", ".gd", ".ge", ".gf", ".gg", ".gh", ".gi", ".gl", ".gm", ".gn", ".gp", ".gq", ".gr", ".gs", ".gt", ".gu", ".gw", ".gy", ".hk", ".hm", ".hn", ".hr", ".ht", ".hu", ".id", ".ie", " No", ".il", ".im", ".in", ".io", ".iq", ".ir", ".is", ".it", ".je", ".jm", ".jo", ".jp", ".ke", ".kg", ".kh", ".ki", ".km", ".kn", ".kp", ".kr", ".kw", ".ky", ".kz", ".la", ".lb", ".lc", ".li", ".lk", ".lr", ".ls", ".lt", ".lu", ".lv", ".ly", ".ma", ".mc", ".md", ".me", ".mg", ".mh", ".mk", ".ml", ".mm", ".mn", ".mo", ".mp", ".mq", ".mr", ".ms", ".mt", ".mu", ".mv", ".mw", ".mx", ".my", ".mz", ".na", ".nc", ".ne", ".nf", ".ng", ".ni", ".nl", ".no", ".np", ".nr", ".nu", ".nz", ".om", ".pa", ".pe", ".pf", ".pg", ".ph", ".pk", ".pl", ".pm", ".pn", ".pr", ".ps", ".pt", ".pw", ".py", ".qa", ".re", ".ro", ".rs", ".ru", ".rw", ".sa", ".sb", ".sc", ".sd", ".se", ".sg", ".sh", ".si", ".sj", ".sk", ".sl", ".sm", ".sn", ".so", ".sr", ".st", ".su", ".sv", ".sy", ".sz", ".tc", ".td", ".tf", ".tg", ".th", ".tj", ".tk", ".tl", ".tm", ".tn", ".to", ".tp", ".tr", ".tt", ".tv", ".tw", ".tz", ".ua", ".ug", ".uk", ".us", ".uy", ".uz", ".va", ".vc", ".ve", ".vg", ".vi", ".vn", ".vu", ".wf", ".ws", ".ye", ".yt", ".za", ".zm", ".zw"])
                if topLevelDomain.isEmpty == false && (TLD.contains(topLevelDomain)) {
                    return true
                }
            }
        }
        return false
    }
    
    var isValidPhone: Bool{
        let phone = NSPredicate(format:"SELF MATCHES %@", ValidationConstant.Regex.PhoneValidation)
        return phone.evaluate(with: trim)
    }
    
    var isValidUrl: Bool{
        let url = NSPredicate(format:"SELF MATCHES %@", argumentArray:[ValidationConstant.Regex.UrlValidation])
        return url.evaluate(with: trim)
    }
    
    var isInteger: Bool{
        let numbersOnly = NSCharacterSet(charactersIn: ValidationConstant.Numeric.INTEGER)
        let characterSetFromText = NSCharacterSet(charactersIn: self)
        let isValid = numbersOnly.isSuperset(of: characterSetFromText as CharacterSet)
        return isValid
    }
    
    var isFloat: Bool{
        let floatsOnly = NSCharacterSet(charactersIn: ValidationConstant.Numeric.FLOAT)
        let characterSetFromText = NSCharacterSet(charactersIn: self)
        let isValid = floatsOnly.isSuperset(of: characterSetFromText as CharacterSet)
        if isValid == true {
            let charCount = self.count
            if charCount == ValidationConstant.Numeric.one
            {
                let firstChar = self.first
                return firstChar != "."
            }
        }
        return isValid
    }
    
    var isAlphabetic: Bool{
        let alphabetsOnly = NSCharacterSet(charactersIn: ValidationConstant.Text.ALPHA)
        let characterSetFromText = NSCharacterSet(charactersIn: self)
        let isValid = alphabetsOnly.isSuperset(of: characterSetFromText as CharacterSet)
        return isValid
    }
    
    var isNumeric: Bool{
        let numericsOnly = NSCharacterSet(charactersIn: ValidationConstant.Numeric.NUMERIC)
        let characterSetFromText = NSCharacterSet(charactersIn: self)
        let isValid = numericsOnly.isSuperset(of: characterSetFromText as CharacterSet)
        return isValid
    }
    
    var isAlphaNumeric: Bool{
        let alphaNumericsOnly = NSCharacterSet(charactersIn: ValidationConstant.Text.ALPHA_NUMERIC)
        let characterSetFromText = NSCharacterSet(charactersIn: self)
        let isValid = alphaNumericsOnly.isSuperset(of: characterSetFromText as CharacterSet)
        return isValid
    }

    func isIntegerWithValidLength(maxLength: Int) -> Bool {
        let numbersOnly = NSCharacterSet(charactersIn: ValidationConstant.Numeric.INTEGER)
        let characterSetFromText = NSCharacterSet(charactersIn: self)
        let isValid = numbersOnly.isSuperset(of: characterSetFromText as CharacterSet)
        if isValid == true {
            if maxLength > ValidationConstant.Numeric.zero && self.count > maxLength {
                return !isValid
            }
        }
        return isValid
    }
    
    func isFloatWithValidLength(maxLength: Int) -> Bool {
        let floatsOnly = NSCharacterSet(charactersIn: ValidationConstant.Numeric.FLOAT)
        let characterSetFromText = NSCharacterSet(charactersIn: self)
        let isValid = floatsOnly.isSuperset(of: characterSetFromText as CharacterSet)
        if isValid == true {
            if  maxLength > ValidationConstant.Numeric.zero && self.count > maxLength {
                return !isValid
            }
            let charCount = self.count
            if charCount == ValidationConstant.Numeric.one
            {
                let firstChar = self.first
                return firstChar != "."
            }
        }
        return isValid
    }
    
    func isAlphabeticWithValidLength(maxLength: Int) -> Bool {
        let alphabetsOnly = NSCharacterSet(charactersIn: ValidationConstant.Text.ALPHA)
        let characterSetFromText = NSCharacterSet(charactersIn: self)
        let isValid = alphabetsOnly.isSuperset(of: characterSetFromText as CharacterSet)
        if isValid == true {
            if  maxLength > ValidationConstant.Numeric.zero && self.count > maxLength {
                return !isValid
            }
        }
        return isValid
    }
    
    func isNumericWithValidLength(maxLength: Int) -> Bool {
        let numericsOnly = NSCharacterSet(charactersIn: ValidationConstant.Numeric.NUMERIC)
        let characterSetFromText = NSCharacterSet(charactersIn: self)
        let isValid = numericsOnly.isSuperset(of: characterSetFromText as CharacterSet)
        if isValid == true {
            if  maxLength > ValidationConstant.Numeric.zero && self.count > maxLength {
                return !isValid
            }
        }
        return isValid
    }
    
    func isAlphaNumericWithValidLength(maxLength: Int) -> Bool {
        let alphaNumericsOnly = NSCharacterSet(charactersIn: ValidationConstant.Text.ALPHA_NUMERIC)
        let characterSetFromText = NSCharacterSet(charactersIn: self)
        let isValid = alphaNumericsOnly.isSuperset(of: characterSetFromText as CharacterSet)
        if isValid == true {
            if  maxLength > ValidationConstant.Numeric.zero && self.count > maxLength {
                return !isValid
            }
        }
        return isValid
    }

}

//***********************************************************************

// MARK: - Dictionary
extension Dictionary
{

    // MARK: - isNonEmpty
    var isNonEmpty: Bool
    {
        if self.count > ValidationConstant.Numeric.zero
        {
            return true
        }
        return false
    }
    
    // MARK: - hasKey
    func hasKey(key: String) -> Bool
    {
        if self.count > ValidationConstant.Numeric.zero
        {
            for dictKey in self.keys
            {
                if dictKey as! String == key
                {
                    return true
                }
            }
        }
        return false
    }

}

//*****************************************************

// MARK: - Array
extension Array
{
    
    // MARK: - isNonEmpty
    var isNonEmpty: Bool
    {
        
        if self.count > ValidationConstant.Numeric.zero
        {
            return true
        }
        return false
    }

}
