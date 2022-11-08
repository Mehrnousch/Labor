//
//  RegisterViewModel.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//

import UIKit
import SwiftyJSON
import Alamofire

protocol RegisterViewModelDelegate {
    func registerSuccess()
    func registerFailed(errorMessages: [String])
}

class RegisterViewModel {
    
    var delegate: RegisterViewModelDelegate?
    
    func register(fullName: String, email: String, password: String) {
        
        let parameters: [String: String] = [
            "full_name": fullName,
            "email": email,
            "password": password
        ]
        
        Alamofire.request(ApiConstants.register, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    
                    let myResponse = JSON(data)
                    let data = myResponse["data"]
                    let errors = myResponse["errors"]

                    if !data.isEmpty {
                        //MARK: - Success
                        self.delegate?.registerSuccess()
                    } else {
                        //MARK: - Failed
                        var errorArray = [String]()
                        for message in errors {
                            for subItem in message.1 {
                                let Item = subItem.1["message"].stringValue
                                if Item != "" {
                                    errorArray.append(Item)
                                }
                            }
                        }
                        self.delegate?.registerFailed(errorMessages: errorArray)
                    }
                    
                case .failure(let error):
                    print("!Error = ", error)
                }
            }
    }
}
