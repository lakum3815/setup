//
//  ExtensionAll.swift
//  TheChangeRoom
//
//  Created by lakum vishal on 03/01/19.
//  Copyright © 2019 lakum vishalbhai rajeshbhai. All rights reserved.
//

import Foundation
import UIKit

//var userDetail = UserProfileDetailsRoot()
//var userFullDetail = UserProfileDetailsRoot()

extension String
{
    var isValidPassword: Bool
    {
        do
        {
            let regex = try NSRegularExpression(pattern: "^(?=.*\\d)(?=.*[a-zA-Z]).{6,20}$", options: [])

            if(regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.length)) != nil)
            {
                return true
            }
            else
            {
                return false
            }
        }
        catch
        {
            return false
        }
    }
    
    var length: Int {
        return self.count
    }
    
    var lengthWithoutSpace: Int {
        return self.removeWhitespace.count
    }
    
    var removeWhitespace: String{
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    
    var localized: String {
        return NSLocalizedString(self, comment:"")
    }
    
    func toInt(defaultValue: Int) -> Int {
        if let n = Int(self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)) {
            return n
        } else {
            return defaultValue
        }
    }
    
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
    
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
    
    func isCompareInsensitive(str: String) -> Bool{
        if self.caseInsensitiveCompare(str) == ComparisonResult.orderedSame{
            return true
        }else{
            return false
        }
    }
    
    func removeAfterSpace() -> String {
        return self.components(separatedBy: " ")[0]
    }
    
    func convertDateformate_24_to12_andReverse (str_date : String , strdateFormat: String, inputFormat: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
        
        let date = dateFormatter.date(from: str_date)
        dateFormatter.dateFormat = strdateFormat
        let datestr = dateFormatter.string(from: date!)
        return datestr
    }
    
    func dateDiff(strEndDate:String) -> Int {
        let f:DateFormatter = DateFormatter()
        f.timeZone = NSTimeZone.local
        f.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let startDate = f.date(from: self)
        let endDate = f.date(from: strEndDate)

        return (startDate?.interval(ofComponent: .minute, fromDate: endDate!))!
    }
    
    func convertToTime(timeStamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timeStamp))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.string(from: date)
    }

    func convertToTime1(timeStamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timeStamp))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.string(from: date)
    }
    
    func msToDate(OPformate: String = "dd/MM/yyyy") -> String {
        if self == "" {
            return ""
        }
        else {
            let dateVar = Date.init(timeIntervalSinceNow: TimeInterval(Int(self)!)/1000)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = OPformate
            return dateFormatter.string(from: dateVar)
        }
    }
    
    func miliSecFromDate(OPformate: String = "dd/MM/yyyy") -> String {
        let strTime = self
        let formatter = DateFormatter()
        formatter.dateFormat = OPformate
        let ObjDate = formatter.date(from: strTime)
        let secs = (ObjDate?.timeIntervalSinceNow)!
        return "\(Int(secs * 1000))"
    }
    
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
}

extension Date {
    
    // Convert local time to UTC (or GMT)
    func toGlobalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = -TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
    
    // Convert UTC (or GMT) to local time
    func toLocalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
    
    func formattedDateFromString(dateString: String, withFormat format: String) -> String? {
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        
        if let date = inputFormatter.date(from: dateString) {
            
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = format
            
            return outputFormatter.string(from: date)
        }
        
        return nil
    }
    
    func formattedDateToFromString(dateString: String, To format: String, fromformate:String) -> String? {
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = fromformate
        
        if let date = inputFormatter.date(from: dateString) {
            
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = format
            
            return outputFormatter.string(from: date)
        }
        
        return nil
    }

    static var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    }

    static var today: Date {
        return Calendar.current.date(byAdding: .day, value: 0, to: Date())!
    }

//    func hours(from date: Date) -> Int {
//        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
//    }
//    /// Returns the amount of minutes from another date
//    func minutes(from date: Date) -> Int {
//        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
//    }

    func interval(ofComponent comp: Calendar.Component, fromDate date: Date) -> Int {
        
        let currentCalendar = Calendar.current
        
        guard let start = currentCalendar.ordinality(of: comp, in: .era, for: date) else { return 0 }
        guard let end = currentCalendar.ordinality(of: comp, in: .era, for: self) else { return 0 }
        
        return end - start
    }
    
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
    
    var millisecondsSince1970:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }

    var CurrentTimeStamp: UInt64 {
        return UInt64((self.timeIntervalSince1970 + 62_135_596_800) * 10_000_000)
    }

}

extension Date {
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return "Now"
    }
}

extension UIColor
{
    convenience init(r: UInt32, g: UInt32, b: UInt32, a: CGFloat)
    {
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    convenience init(hexColorString: String)
    {
        let hex = hexColorString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat)
    {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    

    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:self.frame.size.width , height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func dropShadow(scale: Bool = true)
    {
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowOffset = CGSize(width: 1, height: 3)
        layer.shadowRadius = 1
        layer.masksToBounds = false
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    
}

extension UIButton {
    func rotate360Degrees(duration: CFTimeInterval = 3) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount=Float.infinity
        self.layer.add(rotateAnimation, forKey: nil)
    }
}

extension UILocalizedIndexedCollation
{
    //func for partition array in sections
    func partitionObjects(array:[AnyObject], collationStringSelector:Selector) -> ([AnyObject], [String])
    {
        var unsortedSections = [[AnyObject]]()
        //1. Create a array to hold the data for each section
        
        for _ in self.sectionTitles {
            unsortedSections.append([]) //appending an empty array
        }
        
        //2. Put each objects into a section
        for item in array {
            let index:Int = self.section(for: item, collationStringSelector:collationStringSelector)
            unsortedSections[index].append(item)
        }
        
        //3. sorting the array of each sections
        var sectionTitles = [String]()
        var sections = [AnyObject]()
        for index in 0 ..< unsortedSections.count { if unsortedSections[index].count > 0 {
            sectionTitles.append(self.sectionTitles[index])
            sections.append(self.sortedArray(from: unsortedSections[index], collationStringSelector: collationStringSelector) as AnyObject)
            }
        }
        return (sections, sectionTitles)
    }
}

/*
extension String
{
    var html2Attributed: NSAttributedString? {
        do {
            guard let data = data(using: String.Encoding.utf8) else {
                return nil
            }
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
}
*/

extension UIScrollView
{
    func scrollToBottom()
    {
        if contentSize.height > bounds.size.height
        {
            let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
            setContentOffset(bottomOffset, animated: false)
        }
    }
    
    
    func scrollToTop(animated: Bool)
    {
        let topOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(topOffset, animated: animated)
    }
    
}

extension UITableView
{
    func scrollToLastCall(animated : Bool)
    {
        let lastSectionIndex = self.numberOfSections - 1 // last section
        let lastRowIndex = self.numberOfRows(inSection: lastSectionIndex) - 1 // last row
        self.scrollToRow(at: IndexPath(row: lastRowIndex, section: lastSectionIndex), at: .bottom, animated: animated)
    }
}
extension UITextField
{
    @IBInspectable var placeHolderColor: UIColor?
    {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}

extension UIViewController
{
    func topMostViewController() -> UIViewController
    {
        if self.presentedViewController == nil
        {
            return self
        }
        
        if let navigation = self.presentedViewController as? UINavigationController
        {
            return navigation.visibleViewController!.topMostViewController()
        }
        
        if let tab = self.presentedViewController as? UITabBarController
        {
            if let selectedTab = tab.selectedViewController
            {
                return selectedTab.topMostViewController()
            }
            
            return tab.topMostViewController()
        }
        
        return self.presentedViewController!.topMostViewController()
    }
    
    //MARK:- ~~~~~~~~~~ Show Alert
    
    func showSimpleAlert(_ title: String, message : String){
        AppDelegate.shared().HideSpinnerView()
        
        if message.isNull == false
        {
            let alertView = DTAlertView.init(block: { (alert, buttonIndex, cancelButtonIndex) in
                debugPrint(buttonIndex)
                debugPrint(cancelButtonIndex)
            }, title: title, message: message, cancelButtonTitle: "OK", positiveButtonTitle: nil)
            alertView?.show()
        }
    }
    
    func showAlertWithAction(_ title: String, message : String, completion: @escaping(_ success: Bool) -> Void)
    {
        AppDelegate.shared().HideSpinnerView()
        
        if message.isNull == false
        {
            let alertView = DTAlertView.init(block: { (alert, buttonIndex, cancelButtonIndex) in
                debugPrint(buttonIndex)
                debugPrint(cancelButtonIndex)
                
                completion(true)
                
            }, title: title, message: message, cancelButtonTitle: "OK", positiveButtonTitle: nil)
            alertView?.show()
        }
    }
    
    
    func showAlertWithCancelAction(title:String ,titlePos: String, titleNeg: String, message : String, completion: @escaping(_ success: Bool) -> Void)
    {
        AppDelegate.shared().HideSpinnerView()
        
        if message.isNull == false
        {
            let alertView = DTAlertView.init(block: { (alert, buttonIndex, cancelButtonIndex) in
                debugPrint(buttonIndex)
                debugPrint(cancelButtonIndex)
                
                if buttonIndex == 0
                {
                    completion(false)
                }
                else
                {
                    completion(true)
                }
                
            }, title: title, message: message, cancelButtonTitle: titleNeg, positiveButtonTitle: titlePos)
            alertView?.show()
        }
    }

    
}

extension UIApplication
{
    func topMostViewController() -> UIViewController?
    {
        return self.keyWindow?.rootViewController?.topMostViewController()
    }
}


//struct Utility
extension UIViewController
{
    func backOneVC(animated: Bool)
    {
        self.navigationController?.popViewController(animated: animated)
        //self.dismiss(animated: true, completion: nil)
    }
    
    func moveOnVC(VCMove: UIViewController, animated: Bool)
    {
        self.navigationController?.pushViewController(VCMove, animated: animated)
        //self.present(VCMove, animated: true, completion: nil)
    }
    
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = self.navigationController?.viewControllers.filter({$0.isKind(of: ofClass)}).last {
            self.navigationController?.popToViewController(vc, animated: animated)
        }
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: "device_token")
        UserDefaults.standard.removeObject(forKey: "user_Id")
        UserDefaults.standard.removeObject(forKey: "isLogin")
        UserDefaults.standard.removeObject(forKey: "userName")
        UserDefaults.standard.removeObject(forKey: "Company_Profile")
//        let VC = mainSB.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
//        self.moveOnVC(VCMove: VC, animated: false)
    }
    
    func autoLogin(callBack:@escaping (_ Status:Bool) -> Void) {
//        if Utility.getRememberMe()
//        {
//            self.makeLoginWebServiceCall(callBack: {(status) in
//                callBack(status)
//            })
//        }
//        else
//        {
//            self.showAlertWithAction(AlertMsg.TITLE, message: STR_SESSION.EXPIRED, completion: {(relogin) in
//                if relogin
//                {
//                    self.logout()
//                }
//            })
//        }
        self.makeLoginWebServiceCall(callBack: {(status) in
            callBack(status)
        })

    }
    
    func makeLoginWebServiceCall(callBack:@escaping (_ Status:Bool) -> Void) {
        /*
        UserDetailRoot.shared().tryLogin(strLogin: Utility.getUserEmail()!, strLoginPassword: Utility.getPwd()!, success_block: {(model ,error) in
            
            if (model.null == nil){
                if model["Status"].boolValue {
                    var userDetail = UserDetailRoot()

                    userDetail = UserDetailRoot.init(fromJson: model)
                    Utility.setId(userDetail.data!.id)
                    Utility.setToken(userDetail.data.token)
                    Utility.setUserId(userDetail.data.userId)
                    Utility.setUserEmail(Utility.getUserEmail()!)
                    Utility.setPwd(Utility.getPwd()!)
                    Utility.setIsLogin(userDetail.status)
                    Utility.setIsAdmin(userDetail.data.isAdmin)
                    self.makeUserDetailWebServiceCall(callBack: {(status) in
                        callBack(status)
                    })
                }
                else{
                    if model["Message"].stringValue == STR_SESSION.EXPIRED
                    {
                        self.showAlertWithAction(AlertMsg.TITLE, message: model["Message"].stringValue, completion: {(relogin) in
                            if relogin
                            {
                                self.logout()
                            }
                        })
                    }
                    else
                    {
                        self.showSimpleAlert("", message: model["Message"].stringValue)
                    }
                    callBack(false)
                }
                callBack(model["Status"].boolValue)
            }else{
                if error != nil
                {
                    
                }
                callBack(false)
            }
            
        })
        */
    }
    
    func makeUserDetailWebServiceCall(callBack:@escaping (_ Status:Bool) -> Void) {
        /*
        UserProfileDetailsRoot.shared().getUserProfileDetails(success_block: {(model ,error) in
            
            if (model.null == nil){
                if model["Status"].boolValue {
                    var userFullDetail = UserProfileDetailsRoot()

                    userFullDetail = UserProfileDetailsRoot.init(fromJson: model)
                    Utility.setUserName(userFullDetail.data.fullName)
                    Utility.setProfile(userFullDetail.data.pProfilePicture)
                    callBack(model["Status"].boolValue)
                }
                else{
                    if model["Message"].stringValue == STR_SESSION.EXPIRED
                    {
                        self.showAlertWithAction(AlertMsg.TITLE, message: model["Message"].stringValue, completion: {(relogin) in
                            if relogin
                            {
                                self.logout()
                            }
                        })
                    }
                    else
                    {
                        self.showSimpleAlert("", message: model["Message"].stringValue)
                    }
                    callBack(false)
                }
                callBack(model["Status"].boolValue)
            }else{
                if error != nil
                {
                    
                }
                callBack(false)
            }
            
        })
        */
    }

}


extension UIPageControl {
    
    func customPageControl(dotFillColor:UIColor, dotBorderColor:UIColor, dotBorderWidth:CGFloat) {
        
        for (index, dot) in self.subviews.enumerated() {
            if index == self.currentPage {
                dot.backgroundColor = dotFillColor
                dot.layer.cornerRadius = dot.frame.size.height / 2;
            } else {
                dot.backgroundColor = UIColor.clear
                dot.layer.cornerRadius = dot.frame.size.height / 2
                dot.layer.borderColor = dotFillColor.cgColor
                dot.layer.borderWidth = dotBorderWidth
            }
        }

        /*
        for (pageIndex, dotView) in self.subviews.enumerated() {
            if self.currentPage == pageIndex {
                dotView.backgroundColor = dotFillColor
                dotView.layer.cornerRadius = dotView.frame.size.height / 2
            }else{
                dotView.backgroundColor = .clear
                dotView.layer.cornerRadius = dotView.frame.size.height / 2
                dotView.layer.borderColor = dotBorderColor.cgColor
                dotView.layer.borderWidth = dotBorderWidth
            }
        }
        */
    }
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
extension String {
    func base64Encoded() -> String? {
        return data(using: .utf8)?.base64EncodedString()
    }

    func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
