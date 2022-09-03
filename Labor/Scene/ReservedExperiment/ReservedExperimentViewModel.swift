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
    func gettingReservedListSuccessful(newToken: String)
    func gettingReservedListFailed(errorMessages: [String])
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
