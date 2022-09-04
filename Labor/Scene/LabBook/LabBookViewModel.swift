//
//  LabBookViewModel.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import Foundation
import SwiftyJSON
import Alamofire

protocol LabBookViewModelDelegate {
    func gettingReservedListSuccessful()
    func gettingReservedListFailed()
}

class LabBookViewModel {
    
    var delegate: LabBookViewModelDelegate?
    
    func showExperiment(reservationId: Int, experimentId: Int) {
        
        let headers = [
            "Authorization": "Bearer \(KeyChainStorage.getToken())",
            "Content-Type": "application/x-www-form-urlencoded"
        ]

        Alamofire.request(ApiConstants.showExperiment(reservationId: reservationId, experimentId: experimentId), method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    
                    let myResponse = JSON(data)
                    print("myResponse = \(myResponse)")
                    let data = myResponse["data"]
                    print("data = \(data)")
                    let errors = myResponse["errors"]
                    print("errors = \(errors)")
                    if !data.isEmpty {
                        //MARK: - Success
                        
                        
                    } else {
                        //MARK: - Failed
                        
                    }
                    
                case .failure(let error):
                    print("!Error = ", error)
                }
            }
    }
}
