//
//  LabsViewModel.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//

import UIKit
import SwiftyJSON
import Alamofire

protocol LabsViewModelDelegate {
    func gettingLabsListSuccessful(labs: [LabModel])
    func gettingLabsListFailed()
}

class LabsViewModel {
    
    var delegate: LabsViewModelDelegate?
    
    func getLabList() {
        
        let headers = [
                "Authorization": "Bearer \(KeyChainStorage.getToken())",
                "Content-Type": "application/x-www-form-urlencoded"
        ]
                
        Alamofire.request(ApiConstants.Labs, method: .get, encoding: JSONEncoding.default, headers: headers)
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
                        self.delegate?.gettingLabsListFailed()
                    } else if statusCode.contains(AppTheme.statusCode.success) { //MARK: - Success
                        if !data.isEmpty { //MARK: - Not empty list
                            let dataJson = LabsModel(json: myResponse)
                            if let labs = dataJson.data {
                                self.delegate?.gettingLabsListSuccessful(labs: labs)
                            }
                        } else { //MARK: - Empty list
                            self.delegate?.gettingLabsListSuccessful(labs: [])
                        }
                    }
                    
                case .failure(let error):
                    print("!Error = ", error)
                    self.delegate?.gettingLabsListFailed()
                }
            }
    }
}
