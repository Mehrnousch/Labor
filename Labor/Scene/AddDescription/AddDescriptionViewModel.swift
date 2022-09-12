//
//  AddDescriptionViewModel.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import UIKit
import SwiftyJSON
import Alamofire

protocol AddDescriptionViewModelDelegate {
    func reserveSuccess()
    func reserveFailed(error: String)
}

class AddDescriptionViewModel {
    
    var delegate: AddDescriptionViewModelDelegate?
    
    func addDescription(reservationId: Int, name: String, description: String, firstPhoto: String, secondPhoto: String) {
        
        let parameters: [String: Any] = [
            "name": name,
            "description": description,
            "photos[0]": firstPhoto,
            "photos[1]": secondPhoto,
        ]
        
        let headers = [
            "Authorization": "Bearer \(KeyChainStorage.getToken())",
//            "Content-Type": "application/x-www-form-urlencoded",
            "Content-Type": "multipart/form-data",
            "Accept": "application/json"
        ]
        
        Alamofire.request(ApiConstants.experimentSave(reservationId: reservationId), method: .post, parameters: parameters, encoding: URLEncoding(destination: .httpBody), headers: headers)
            .responseJSON { response in
                switch response.result { //MARK: - Fix
                case .success(let data):
                    let myResponse = JSON(data)
                    
                    let data = myResponse["data"]
                    let errors = myResponse["errors"]
                    let message = MessageModel(json: myResponse["message"])
                    print("!!@@ data = \(data)")
                    print("!!@@ errors = \(errors)")
                    print("!!@@ message = \(message)")
                    
                    let statusCode = message.code
                    
                    if statusCode.contains(AppTheme.statusCode.error) { //MARK: - Failed
                        self.delegate?.reserveFailed(error: message.text)
                    } else if statusCode.contains(AppTheme.statusCode.success) { //MARK: - Success
                        self.delegate?.reserveSuccess()
                    }
                    
                case .failure(let error):
                    print("!Error = ", error)
                    self.delegate?.reserveFailed(error: "Error = \(error)")
                }
            }
    }
    
    
    
    
//    func uploadImageAndData(){
//        //parameters
//        let gender    = "M"
//        let firstName = "firstName"
//        let lastName  = "lastName"
//        let dob       = "11-Jan-2000"
//        let aboutme   = "aboutme"
//        let token     = "token"
//
//        var parameters = [String:AnyObject]()
//        parameters = ["gender":gender,
//                      "firstName":firstName,
//                      "dob":dob,
//                      "aboutme":about,
//                      "token":token,
//                      "lastName":lastName]
//
//        let URL = "http://yourserviceurl/"
//        let image = UIImage(named: "image.png")
//
//        Alamofire.upload(<#T##data: Data##Data#>, to: <#T##URLConvertible#>)
//        Alamofire.upload(.POST, URL, multipartFormData: {
//            multipartFormData in
//
//            if let imageData = UIImageJPEGRepresentation(image, 0.6) {
//                multipartFormData.appendBodyPart(data: imageData, name: "image", fileName: "file.png", mimeType: "image/png")
//            }
//
//            for (key, value) in parameters {
//                multipartFormData.appendBodyPart(data: value.dataUsingEncoding(NSUTF8StringEncoding)!, name: key)
//            }
//        }, encodingCompletion: {
//            encodingResult in
//
//            switch encodingResult {
//            case .Success(let upload, _, _):
//                print("s")
//                upload.responseJSON {
//                    response in
//                    print(response.request)  // original URL request
//                    print(response.response) // URL response
//                    print(response.data)     // server data
//                    print(response.result)   // result of response serialization
//
//                    if let JSON = response.result.value {
//                        print("JSON: \(JSON)")
//                    }
//                }
//            case .Failure(let encodingError):
//                print(encodingError)
//            }
//        })
//    }
}



