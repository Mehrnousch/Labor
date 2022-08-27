//
//  RegisterViewModel.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//

import Foundation
//import SwiftyJSON

protocol RegisterViewModelDelegate {
    func registerSuccess(successMessage: String)
    func registerFailed()
}

class RegisterViewModel {
    
    var delegate: RegisterViewModelDelegate?
//    let requestManager = RequestManager()
    
    
}
