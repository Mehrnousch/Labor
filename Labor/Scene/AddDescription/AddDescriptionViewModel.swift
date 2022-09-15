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
    func reserveFailed()
}

class AddDescriptionViewModel {
    
    var delegate: AddDescriptionViewModelDelegate?
    
    func addDescription(reservationId: Int, name: String, description: String, firstPhoto: Data, secondPhoto: Data) {
        
        let headers = [
            "Authorization": "Bearer \(KeyChainStorage.getToken())",
            "Content-Type": "multipart/form-data",
            "Accept": "application/json"
        ]
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
//            for (key, value) in parameters {
//                multipartFormData.append(value.data(using: .utf8)!, withName: "photos[0]")
//            }
                multipartFormData.append(firstPhoto, withName: "photos[0]", fileName: "user41.jpg", mimeType: "image/jpeg")
                multipartFormData.append(secondPhoto, withName: "photos[1]", fileName: "user31.jpg", mimeType: "image/jpeg")
                multipartFormData.append(name.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"name")
                multipartFormData.append(description.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"description")

            }, to: ApiConstants.experimentSave(reservationId: reservationId), method: .post, headers: headers, encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, let url):
                    
                    upload.responseJSON { data in
                        let myResponse = JSON(data.result.value)

                        let data = myResponse["data"]
                        let errors = myResponse["errors"]
                        let message = MessageModel(json: myResponse["message"])
                        print("!!@@ data = \(data)")
                        print("!!@@ errors = \(errors)")
                        print("!!@@ message = \(message)")
                        
                        let statusCode = message.code
                        
                        if statusCode.contains(AppTheme.statusCode.error) { //MARK: - Failed
                            self.delegate?.reserveFailed()
                        } else if statusCode.contains(AppTheme.statusCode.success) { //MARK: - Success
                            self.delegate?.reserveSuccess()
                        }
                    }
                    
                    upload.uploadProgress { progress in
                        //call progress callback here if you need it
                    }
                case .failure(let encodingError):
                    print("multipart upload encodingError: \(encodingError)")
                    self.delegate?.reserveFailed()
                }
            })
    }
    
    
    
//    let parameters: [String: Any] = [
//        "name": name,
//        "description": description,
//        "photos[0]": firstPhoto,
//        "photos[1]": secondPhoto,
//    ]
        
//        Alamofire.uplo(ApiConstants.experimentSave(reservationId: reservationId), method: .post, parameters: parameters, encoding: URLEncoding(destination: .httpBody), headers: headers)
//            .responseJSON { response in
//                switch response.result { //MARK: - Fix
//                case .success(let data):
//                    let myResponse = JSON(data)
//                    print("!!@@ myResponse = \(myResponse)")
//
//                    let data = myResponse["data"]
//                    let errors = myResponse["errors"]
//                    let message = MessageModel(json: myResponse["message"])
//                    print("!!@@ data = \(data)")
//                    print("!!@@ errors = \(errors)")
//                    print("!!@@ message = \(message)")
//
//                    let statusCode = message.code
//
//                    if statusCode.contains(AppTheme.statusCode.error) { //MARK: - Failed
//                        self.delegate?.reserveFailed(error: message.text)
//                    } else if statusCode.contains(AppTheme.statusCode.success) { //MARK: - Success
//                        self.delegate?.reserveSuccess()
//                    }
//
//                case .failure(let error):
//                    print("!Error = ", error)
//                    self.delegate?.reserveFailed(error: "Error = \(error)")
//                }
//            }
//    }
}



