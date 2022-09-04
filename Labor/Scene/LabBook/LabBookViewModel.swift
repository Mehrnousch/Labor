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
    func gettingReservedListSuccessful(experiments: [ExperimentModel])
    func gettingReservedListFailed()
}

class LabBookViewModel {
    
    var delegate: LabBookViewModelDelegate?
    
    func showExperiment(reservationId: Int) {
        
        let headers = [
            "Authorization": "Bearer \(KeyChainStorage.getToken())",
            "Content-Type": "application/x-www-form-urlencoded"
        ]

        Alamofire.request(ApiConstants.experimentList(reservationId: reservationId), method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    
                    let myResponse = JSON(data)
                    print("myResponse = \(myResponse)")
                    let dataJson = ExperimentsModel(json: myResponse["data"])
                    let data = myResponse["data"]
                    print("data = \(data)")
                    let errors = myResponse["errors"]
                    print("errors = \(errors)")
                    if !data.isEmpty {
                        //MARK: - Success
                        if let experiments = dataJson.experiments {
                            self.delegate?.gettingReservedListSuccessful(experiments: experiments)
                        }
                        
                    } else {
                        //MARK: - Failed
                        
                    }
                    
                case .failure(let error):
                    print("!Error = ", error)
                }
            }
    }
}
