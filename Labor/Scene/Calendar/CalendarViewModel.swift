//
//  CalendarViewModel.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//

import Foundation
import SwiftyJSON
import Alamofire

protocol CalendarViewModelDelegate {
    func gettingReservedTimeSuccessful(reservations: [ReservedModel])
    func gettingReservedTimeFailed()
}

class CalendarViewModel {
    
    var delegate: CalendarViewModelDelegate?
    
    func getReservedList(laborId: Int) {
        
        let headers = [
            "Authorization": "Bearer \(KeyChainStorage.getToken())",
            "Content-Type": "application/x-www-form-urlencoded"
        ]
                
        Alamofire.request(ApiConstants.reservedationTime(laborId: laborId), method: .get, encoding: JSONEncoding.default, headers: headers)
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
                        self.delegate?.gettingReservedTimeFailed()
                    } else if statusCode.contains(AppTheme.statusCode.success) { //MARK: - Success
                        let reservations = ReservationsModel(json: data)
                        if let reservations = reservations.reservations {
                            self.delegate?.gettingReservedTimeSuccessful(reservations: reservations)
                        }
                    }
                    
                case .failure(let error):
                    print("!Error = ", error)
                    self.delegate?.gettingReservedTimeFailed()
                }
            }
    }
}
