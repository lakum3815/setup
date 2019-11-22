//
//  APIManager.swift
//  TheChangeRoom
//
//  Created by lakum vishal on 03/01/19.
//  Copyright © 2019 lakum vishalbhai rajeshbhai. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import SWCompression

class APIManager
{
    
    class var shared : APIManager
    {
        struct Static
        {
            static let instance : APIManager = APIManager()
        }
        return Static.instance
    }
    
    
    func GETDataFROMServer(webservice: String, callBack:@escaping (_ dataFromServer: JSON?, _ error:Error?) -> Void) -> DataRequest
    {
        AppDelegate.shared().ShowSpinnerView()

        let url = webservice
        
        let request =  Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    print("\nWeb Call URL Success :- \(url)\nParam :- []\n Result :- \(JSON(data))")
                    let decompressedData = try? GzipArchive.unarchive(archive: data as! Data)

                    let finalJson = JSON(decompressedData as Any)
                    callBack(finalJson,nil)
                }
                break
                
            case .failure(_):
                if let error1 = response.result.error
                {
                    print("\nWeb Call URL Failure :- \(url)\n Result :- \(error1)")

                    callBack(nil,error1)
                }

                // debugprint("\nResponse ERROR:\n",response)
                break
            }
            AppDelegate.shared().HideSpinnerView()
        }
        // debug
        print(request)
        return request
        
    }
    
    func GETDataFROMServerWithHeaders(webservice: String, customHeader: HTTPHeaders, callBack:@escaping (_ dataFromServer: JSON?, _ error:Error?) -> Void) -> DataRequest
    {
        AppDelegate.shared().ShowSpinnerView()
        
        let url = webservice
        
        let request =  Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: customHeader).responseJSON { (response:DataResponse<Any>) in
            
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    print("\nWeb Call URL Success :- \(url)\nParam :- []\n Result :- \(JSON(data))")

                    let finalJson = JSON(data)
                    callBack(finalJson,nil)
                }
                break
                
            case .failure(_):
                if let error1 = response.result.error
                {
                    print("\nWeb Call URL Failure :- \(url)\n Result :- \(error1)")
                    
                    callBack(nil,error1)
                }
                
                // debugprint("\nResponse ERROR:\n",response)
                break
            }
            AppDelegate.shared().HideSpinnerView()
        }
        // debug
        print(request)
        return request
        
    }
    
    func GETDataFROMServerWithParam(webservice: String, parameter: [String: Any], callBack:@escaping (_ dataFromServer: JSON?, _ error:Error?) -> Void) -> DataRequest
    {
        AppDelegate.shared().ShowSpinnerView()
        
        let url = webservice
        
        let request =  Alamofire.request(url, method: .get, parameters: parameter, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    print("\nWeb Call URL Success :- \(url)\nParam :- \(parameter)\n Result :- \(JSON(data))")

                    let finalJson = JSON(data)
                    callBack(finalJson,nil)
                }
                break
                
            case .failure(_):
                if let error1 = response.result.error
                {
                    print("\nWeb Call URL Failure :- \(url)\n Result :- \(error1)")
                    
                    callBack(nil,error1)
                }
                
                // debugprint("\nResponse ERROR:\n",response)
                break
            }
            AppDelegate.shared().HideSpinnerView()
        }
        // debug
        print(request)
        return request
        
    }
    
    func GETDataFROMServerWithParamAndHeader(webservice: String, parameter: [String: Any], customHeader: HTTPHeaders, callBack:@escaping (_ dataFromServer: JSON?, _ error:Error?) -> Void) -> DataRequest
    {
        AppDelegate.shared().ShowSpinnerView()
        
        let url = webservice
        
        let request =  Alamofire.request(url, method: .get, parameters: parameter, encoding: URLEncoding.default, headers: customHeader).responseJSON { (response:DataResponse<Any>) in
            
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    print("\nWeb Call URL Success :- \(url)\nParam :- \(parameter)\n Result :- \(JSON(data))")

                    let finalJson = JSON(data)
                    callBack(finalJson,nil)
                }
                break
                
            case .failure(_):
                if let error1 = response.result.error
                {
                    print("\nWeb Call URL Failure :- \(url)\n Result :- \(error1)")
                    
                    callBack(nil,error1)
                }
                
                // debugprint("\nResponse ERROR:\n",response)
                break
            }
            AppDelegate.shared().HideSpinnerView()
        }
        // debug
        print(request)
        return request
        
    }
    
    func PostJsonDataToServer(webservice: String, parameter: [String: Any], start:Bool = true, stop:Bool, callBack:@escaping (_ dataFromServer: JSON?, _ error:Error?) -> Void) -> DataRequest
    {
        if start {AppDelegate.shared().ShowSpinnerView()}
        
        let url = webservice
        
        let request = Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: ["Content-Type":"application/json", "Token": Utility.getToken()!]).responseJSON { (response:DataResponse<Any>) in
           
            switch(response.result)
            {
            case .success(_):
                if let data = response.result.value
                {
                    print("\nWeb Call URL Success :- \(url)\nParam :- \(parameter)\n Result :- \(JSON(data))")

                    let finalJson = JSON(data)
                    callBack(finalJson,nil)
                }
                break
                
            case .failure(_):
                
                    if let error = response.result.error
                    {
                        print("\nWeb Call URL Failure :- \(url)\nParam :- \(parameter)\n Result :- \(error)")
                        AppDelegate.shared().HideSpinnerView()
                        Utility.showError(error: error as NSError)
                        callBack(nil,error)
                    }

                break
            }
            if webservice != API.BASEURL + API.NEWPOST
            {
                if stop {AppDelegate.shared().HideSpinnerView()}
            }
        }
        // debug
        print(request)
        return request
    }
    
    func PostJsonArrayDataToServer(webservice: String, parameter: Any, callBack:@escaping (_ dataFromServer: JSON?, _ error:Error?) -> Void) -> URLRequest
    {
        AppDelegate.shared().ShowSpinnerView()
        
        let url = webservice
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(API.TOKEN, forHTTPHeaderField: "token")
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameter)
         Alamofire.request(request)
            .responseJSON { response in
                // do whatever you want here
                switch response.result {
                case .failure(let error):
                    callBack(nil,error)
                case .success(let responseObject):
                    let finalJson = JSON(responseObject)
                    callBack(finalJson,nil)
                    print(responseObject)
                }
                AppDelegate.shared().HideSpinnerView()
        }
        print(request)
        return request
    }
    
    
    func PostRequestToServer(webservice: String,client_name: String, password: String, callBack:@escaping (_ dataFromServer: JSON?, _ error:Error?) -> Void) -> URLRequest
    {
        AppDelegate.shared().ShowSpinnerView()
        
        let url = webservice
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let passdata = CryptLib().encrypt(password.data(using: .utf8), key: AES256Encryption.key, iv: AES256Encryption.iv).base64EncodedString()

        request.setValue(API.TOKEN, forHTTPHeaderField: "token")
        request.setValue(client_name, forHTTPHeaderField: "ClientName")
        request.setValue(passdata, forHTTPHeaderField: "Password")
        Alamofire.request(request)
            .responseJSON { response in
                // do whatever you want here
                switch response.result {
                case .failure(let error):
                    callBack(nil,error)
                case .success(let responseObject):
                    let finalJson = JSON(responseObject)
                    callBack(finalJson,nil)
                    print(responseObject)
                }
                AppDelegate.shared().HideSpinnerView()
        }
        print(request)
        return request
    }
    
    
    func uplaodImage(webservice: String, with image: UIImage, fileName: String, parameter: [String: String], procssControll: Bool, callBack:@escaping (_ dataFromServer: JSON?, _ error:Error?) -> Void) {

        if procssControll
        {
            AppDelegate.shared().ShowSpinnerView()
        }

        let imgData = image.jpegData(compressionQuality : 0.5)
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imgData!, withName: "UploadedImage",fileName: fileName, mimeType: "image/jpg")
            for (key, value) in parameter {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            } //Optional for extra parameters
        }, to:webservice)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (progress) in
                    print("Upload Progress: \(progress.fractionCompleted)")
                })
                
                upload.responseJSON { response in
                    print(response.result.value!)
                    if let data = response.result.value
                    {
                        print("\nWeb Call URL Success :- \(webservice)\nParam :- \(parameter)\n Result :- \(JSON(data))")
                        
                        let finalJson = JSON(data)
                        callBack(finalJson,nil)
                    }
                }
                break
            case .failure(let encodingError):
                print("\nWeb Call URL Failure :- \(webservice)\nParam :- \(parameter)\n Result :- \(encodingError)")
                callBack(nil,encodingError)
                break
            }
//            if procssControll
//            {
//                AppDelegate.shared().HideSpinnerView()
//            }
        }
        print(request)
    }
    
    func uplaodVideo(webservice: String, with Video: Data, fileName: String, parameter: [String: String], callBack:@escaping (_ dataFromServer: JSON?, _ error:Error?) -> Void) {
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(Video, withName: "UploadedVideo",fileName: fileName, mimeType: "video/mp4")
            for (key, value) in parameter {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            } //Optional for extra parameters
        }, to:webservice)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (progress) in
                    print("Upload Progress: \(progress.fractionCompleted)")
                })
                
                upload.responseJSON { response in
                    print(response.result.value!)
                    if let data = response.result.value
                    {
                        print("\nWeb Call URL Success :- \(webservice)\nParam :- \(parameter)\n Result :- \(JSON(data))")
                        
                        let finalJson = JSON(data)
                        callBack(finalJson,nil)
                    }
                }
                break
            case .failure(let encodingError):
                print("\nWeb Call URL Failure :- \(webservice)\nParam :- \(parameter)\n Result :- \(encodingError)")
                callBack(nil,encodingError)
                break
            }
        }
        print(request)
    }
    
    func uplaodAudio(webservice: String, with Audio: Data, fileName: String, parameter: [String: String], callBack:@escaping (_ dataFromServer: JSON?, _ error:Error?) -> Void) {
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(Audio, withName: "UploadedAudio",fileName: fileName, mimeType: "audio/mp3")
            for (key, value) in parameter {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            } //Optional for extra parameters
        }, to:webservice)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (progress) in
                    print("Upload Progress: \(progress.fractionCompleted)")
                })
                
                upload.responseJSON { response in
                    print(response.result.value!)
                    if let data = response.result.value
                    {
                        print("\nWeb Call URL Success :- \(webservice)\nParam :- \(parameter)\n Result :- \(JSON(data))")
                        
                        let finalJson = JSON(data)
                        callBack(finalJson,nil)
                    }
                }
                break
            case .failure(let encodingError):
                print("\nWeb Call URL Failure :- \(webservice)\nParam :- \(parameter)\n Result :- \(encodingError)")
                callBack(nil,encodingError)
                break
            }
        }
        print(request)
    }
}
extension String: ParameterEncoding
{
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}

struct JSONArrayEncoding: ParameterEncoding {
    private let array: [Parameters]
    
    init(array: [Parameters]) {
        self.array = array
    }
    
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var urlRequest = try urlRequest.asURLRequest()
        
        let data = try JSONSerialization.data(withJSONObject: array, options: [])
        
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        urlRequest.httpBody = data
        
        return urlRequest
    }
}

class Connectivity
{
    
    class func isConnectedToInternet(completion: @escaping(_ success: Bool) -> Void)
    {
        if NetworkReachabilityManager()!.isReachable
        {
            completion(true)
        }
        else
        {
            completion(false)
        }
    }
    
}



