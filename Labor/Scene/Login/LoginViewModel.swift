//
//  LoginViewModel.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//

import Foundation
import SwiftyJSON
import Alamofire

protocol LoginViewModelDelegate {
    func loginSuccess(newToken: String)
    func loginFailed(errorMessages: [String])
}

class LoginViewModel {
    
    var delegate: LoginViewModelDelegate?
    
    func login(email: String, password: String, deviceName: String) {
        
        let parameters: [String: String] = [
            "email": email,
            "password": password,
            "device_name": deviceName
        ]
        
        Alamofire.request(ApiConstants.login, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    
                    let myResponse = JSON(data)
                    print(myResponse)
                    let data = myResponse["data"]
                    let errors = myResponse["errors"]
                    print("errors = \(errors)")
                    if !data.isEmpty {
                        //MARK: - Success
                        let token = data["access token"]["token"].stringValue
                        self.delegate?.loginSuccess(newToken: token)
                        
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
                        self.delegate?.loginFailed(errorMessages: errorArray)
                    }
                    
                case .failure(let error):
                    print("!Error = ", error)
                }
            }
    }
}
