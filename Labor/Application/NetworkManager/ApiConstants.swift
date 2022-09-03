//
//  ApiConstants.swift
//  Labor
//
//  Created by mehrnoush abdinian on 29.08.22.
//

import Foundation

class ApiConstants {
    static let baseApiURL: String = "https://api.laboratoryappointment.de/v1"

    static let register: URL = URL(string: ApiConstants.baseApiURL + "/user/register")!
    static let login: URL = URL(string: ApiConstants.baseApiURL + "/user/login")!
    static let reservedList: URL = URL(string: ApiConstants.baseApiURL + "/user/reservation/list")!
    static let Labs: URL = URL(string: ApiConstants.baseApiURL + "/laboratory/list")!
}
