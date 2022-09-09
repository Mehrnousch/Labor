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
    func gettingReservedTimeSuccessful()
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
                switch response.result {
                case .success(let data):
                    
                    let myResponse = JSON(data)
                    print("myResponse = \(myResponse)")
                    let dataJson = ReservationsModel(json: myResponse["data"])
                    let data = myResponse["data"]
                    print("data = \(data)")
                    let errors = myResponse["errors"]
                    print("errors = \(errors)")
                    if !data.isEmpty {
                        //MARK: - Success
                        self.delegate?.gettingReservedTimeSuccessful()
                    } else {
                        //MARK: - Failed
                        self.delegate?.gettingReservedTimeFailed()
                    }
                    
                case .failure(let error):
                    print("!Error = ", error)
                }
            }
    }
}
