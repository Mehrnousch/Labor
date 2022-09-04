//
//  LabsViewModel.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//

import Foundation
import SwiftyJSON
import Alamofire

protocol LabsViewModelDelegate {
    func gettingLabsListSuccessful(labs: [LabModel])
    func gettingLabsListFailed()
}

class LabsViewModel {
    
    var delegate: LabsViewModelDelegate?
    
    func getLabList() {
        
        let headers = [
                "Authorization": "Bearer \(KeyChainStorage.getToken())",
                "Content-Type": "application/x-www-form-urlencoded"
        ]
                
        Alamofire.request(ApiConstants.Labs, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    
                    let myResponse = JSON(data)
                    print("myResponse = \(myResponse)")
                    let dataJson = LabsModel(json: myResponse)
                    let data = myResponse["data"]
                    print("data = \(data)")
                    let errors = myResponse["errors"]
                    print("errors = \(errors)")
                    if !data.isEmpty {
                        //MARK: - Success
                        if let labs = dataJson.data {
                            self.delegate?.gettingLabsListSuccessful(labs: labs)
                        }
                    } else {
                        //MARK: - Failed
                        self.delegate?.gettingLabsListFailed()
                    }
                    
                case .failure(let error):
                    print("!Error = ", error)
                }
            }
    }
}
