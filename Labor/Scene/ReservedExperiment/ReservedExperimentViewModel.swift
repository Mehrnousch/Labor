//
//  ExperimenteViewModel.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//

import Foundation
import SwiftyJSON
import Alamofire

protocol ReservedExperimentViewModelDelegate {
    func gettingReservedListSuccessful(reservations: [ReservedModel])
    func gettingReservedListFailed(error: String)
}

class ReservedExperimentViewModel {
    
    var delegate: ReservedExperimentViewModelDelegate?
    
    func getReservedList() {
        
        let headers = [
            "Authorization": "Bearer \(KeyChainStorage.getToken())",
            "Content-Type": "application/x-www-form-urlencoded"
        ]
                
        Alamofire.request(ApiConstants.reservedList, method: .get, encoding: JSONEncoding.default, headers: headers)
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
                        self.delegate?.gettingReservedListFailed(error: message.text)
                    } else if statusCode.contains(AppTheme.statusCode.success) { //MARK: - Success
                        if !data.isEmpty { //MARK: - Not empty list
                            let dataJson = ReservationsModel(json: data)
                            if let reservations = dataJson.reservations {
                                self.delegate?.gettingReservedListSuccessful(reservations: reservations)
                            }
                        } else { //MARK: - Empty list
                            self.delegate?.gettingReservedListSuccessful(reservations: [])
                        }
                    }
                    
                case .failure(let error):
                    print("!Error = ", error)
                    self.delegate?.gettingReservedListFailed(error: "Error = \(error)")
                }
            }
    }
}
