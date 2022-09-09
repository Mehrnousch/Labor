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
    func reserveFailed()
}

class FinalReserveViewModel {
    
    var delegate: FinalReserveViewModelDelegate?
    
    func finalReserve(laborId: Int, startAt: String, endAt: String, supervisorNeeded: Int, title: String, description: String) {
        
        let parameters: [String: Any] = [
            "start_at": 1662720099, //startAt,
            "end_at": 1662720100, //endAt,
            "supervisor_needed": 1,
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
                
                print("response = \(response)")
                
                switch response.result {
                case .success(let data):
                    
                    let myResponse = JSON(data)
                    print(myResponse)
                    let data = myResponse["data"]
                    let errors = myResponse["errors"]
                    print("errors = \(errors)")
                    if !data.isEmpty {
                        //MARK: - Success
                        self.delegate?.reserveSuccess()
                    } else {
                        //MARK: - Failed
                        self.delegate?.reserveFailed()
                    }
                    
                case .failure(let error):
                    print("!Error = ", error)
                }
            }
    }
}
