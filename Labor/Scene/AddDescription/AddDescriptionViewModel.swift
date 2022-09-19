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
                
                multipartFormData.append(firstPhoto, withName: "photos[0]", fileName: "user41.jpg", mimeType: "image/jpeg")
                multipartFormData.append(secondPhoto, withName: "photos[1]", fileName: "user31.jpg", mimeType: "image/jpeg")
                multipartFormData.append(name.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"name")
                multipartFormData.append(description.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"description")

            }, to: ApiConstants.experimentSave(reservationId: reservationId), method: .post, headers: headers, encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, let url):
                    
                    upload.responseJSON { data in
                        let myResponse = JSON(data.result.value)
                        print("!!@@ data = \(data)")

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
}
