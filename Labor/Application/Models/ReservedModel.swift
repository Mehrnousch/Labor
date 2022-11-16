//
//  ReservedModel.swift
//  Labor
//
//  Created by mehrnoush abdinian on 03.09.22.
//
import UIKit
import SwiftyJSON

struct ReservationsModel {
    var reservations: [ReservedModel]?
    
    init(json: JSON) {
        reservations = json["reservations"].arrayValue.map({ReservedModel(json: $0)})
    }
}

struct ReservedModel {
    var id: Int
    var title: String
    var needToSupervisor: String
    var startDate_Time: Int32
    var endDate_Time: Int32
    var laboratory: Laboratory
    var didSelecte:Bool

    init(json: JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
        needToSupervisor = json["need to supervisor"].stringValue
        startDate_Time = json["start date-time"].int32Value
        endDate_Time = json["end date-time"].int32Value
        laboratory = Laboratory(json: json["laboratory"])
        didSelecte = false
    }
}

struct Laboratory {
    var id: Int
    var name: String
    
    init(json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
    }
}
