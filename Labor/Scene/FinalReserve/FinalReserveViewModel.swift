//
//  ReservationConfirmationViewModel.swift
//  Labor
//
//  Created by mehrnoush abdinian on 01.09.22.
//

import Foundation
import SwiftyJSON
import Alamofire

protocol FinalReserveViewModelDelegate {
    func reserveSuccess()
    func reserveFailed(error: String)
}

class FinalReserveViewModel {
    
    var delegate: FinalReserveViewModelDelegate?
    
    func finalReserve(laborId: Int, startAt: Double, endAt: Double, supervisorNeeded: Int, title: String, description: String) {
        
        let parameters: [String: Any] = [
            "start_at": startAt,
            "end_at": endAt,
            "supervisor_needed": supervisorNeeded,
            "title": title,
            "description": description
        ]
        
        let headers = [
            "Authorization": "Bearer \(KeyChainStorage.getToken())",
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json"
        ]
        
        Alamofire.request(ApiConstants.finalReserve(laborId: laborId), method: .post, parameters: parameters, encoding: URLEncoding(destination: .httpBody), headers: headers)
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
}
