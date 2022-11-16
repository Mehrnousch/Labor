//
//  LabBookViewModel.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//
import UIKit
import SwiftyJSON
import Alamofire

protocol LabBookViewModelDelegate {
    func gettingReservedListSuccessful(experiments: [ExperimentModel])
    func gettingReservedListFailed()
    func deleteExperimentDescriptionSuccessful()
    func deleteExperimentDescriptionFailed()
}

class LabBookViewModel {
    
    var delegate: LabBookViewModelDelegate?
    
    func experimentList(reservationId: Int) {
        
        let headers = [
            "Authorization": "Bearer \(KeyChainStorage.getToken())",
            "Content-Type": "application/x-www-form-urlencoded"
        ]

        Alamofire.request(ApiConstants.experimentList(reservationId: reservationId), method: .get, encoding: JSONEncoding.default, headers: headers)
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
                        self.delegate?.gettingReservedListFailed()
                    } else if statusCode.contains(AppTheme.statusCode.success) { //MARK: - Success
                        if !data.isEmpty { //MARK: - Not empty list
                            let dataJson = ExperimentsModel(json: myResponse["data"])
                            if let experiments = dataJson.experiments {
                                self.delegate?.gettingReservedListSuccessful(experiments: experiments)
                            }
                        } else { //MARK: - Empty list
                            self.delegate?.gettingReservedListSuccessful(experiments: [])
                        }
                    }
                    
                case .failure(let error): //MARK: - Failed
                    print("!Error = ", error)
                    self.delegate?.gettingReservedListFailed()
                }
            }
    }
    
    func deleteReservedExperiment(reservedId: Int, experimentId: Int) {
        
        let headers = [
            "Authorization": "Bearer \(KeyChainStorage.getToken())",
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        Alamofire.request(ApiConstants.deleteExperimentDescription(reservedId: reservedId, experimentId: experimentId), method: .post, encoding: JSONEncoding.default, headers: headers)
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
                        self.delegate?.deleteExperimentDescriptionFailed()
                    } else if statusCode.contains(AppTheme.statusCode.success) { //MARK: - Success
                        if !data.isEmpty { //MARK: - Not empty list
                            self.delegate?.deleteExperimentDescriptionSuccessful()
                        } else { //MARK: - Empty list
                            self.delegate?.deleteExperimentDescriptionSuccessful()
                        }
                    }
                    
                case .failure(let error):
                    print("!Error = ", error)
                    self.delegate?.deleteExperimentDescriptionFailed()
                }
            }
    }
}
