//
//  ApiConstants.swift
//  Labor
//
//  Created by mehrnoush abdinian on 29.08.22.
//

import UIKit

class ApiConstants {
    static let baseApiURL: String = "https://api.laboratoryappointment.de/v1"
    static let register: URL = URL(string: ApiConstants.baseApiURL + "/user/register")!
    static let login: URL = URL(string: ApiConstants.baseApiURL + "/user/login")!
    static let reservedList: URL = URL(string: ApiConstants.baseApiURL + "/user/reservation/list")!
    static let Labs: URL = URL(string: ApiConstants.baseApiURL + "/laboratory/list")!
    static let logout: URL = URL(string: ApiConstants.baseApiURL + "/user/logout")!
    class func experimentList(reservationId: Int) -> URL {
        return URL(string: ApiConstants.baseApiURL + "/user/reservation/\(reservationId)/experiment/list")!
    }
    class func experimentSave(reservationId: Int) -> URL {
        return URL(string: ApiConstants.baseApiURL + "/user/reservation/\(reservationId)/experiment/save")!
    }
    class func showExperiment(reservationId: Int, experimentId: Int) -> URL {
        return URL(string: ApiConstants.baseApiURL + "/user/reservation/\(reservationId)/experiment/\(experimentId)/")!
    }
    class func reservedationTime(laborId: Int) -> URL {
        return URL(string: ApiConstants.baseApiURL + "/laboratory/\(laborId)/reservation/list")!
    }
    class func finalReserve(laborId: Int) -> URL {
        return URL(string: ApiConstants.baseApiURL + "/laboratory/\(laborId)/reservation/save")!
    }
    class func downloadFile(id: Int) -> URL {
        return URL(string: ApiConstants.baseApiURL + "/user/file/\(id)")!
    }
    class func deleteReservedExperiment(reservedId: Int) -> URL {
        return URL(string: ApiConstants.baseApiURL + "/user/reservation/\(reservedId)/delete")!
    }
    class func deleteExperimentDescription(reservedId: Int, experimentId: Int) -> URL {
        return URL(string: ApiConstants.baseApiURL + "/user/reservation/\(reservedId)/experiment/\(experimentId)/delete")!
    }
}


