//
//  ShowExperimentViewModel.swift
//  Labor
//
//  Created by mehrnoush abdinian on 04.09.22.
//

import Foundation
import SwiftyJSON
import Alamofire

protocol ShowExperimentViewModelDelegate {
    func showExperimentSuccessful(result: DetailsEexperimentModel)
    func showExperimentFailed()
}

class ShowExperimentViewModel {
    
    var delegate: ShowExperimentViewModelDelegate?
    
    func showExperiment(reservationId: Int, experimentId: Int) {
        
        let headers = [
            "Authorization": "Bearer \(KeyChainStorage.getToken())",
            "Content-Type": "application/x-www-form-urlencoded"
        ]

        Alamofire.request(ApiConstants.showExperiment(reservationId: reservationId, experimentId: experimentId), method: .get, encoding: JSONEncoding.default, headers: headers)
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
                        self.delegate?.showExperimentFailed()
                    } else if statusCode.contains(AppTheme.statusCode.success) { //MARK: - Success
                        let experiment = DetailsEexperimentModel(json: data["experiment"])
                        self.delegate?.showExperimentSuccessful(result: experiment)
                    }
                    
                case .failure(let error):
                    print("!Error = ", error)
                    self.delegate?.showExperimentFailed()
                }
            }
    }
}
