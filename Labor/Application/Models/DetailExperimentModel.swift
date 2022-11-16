//
//  DetailExperimentModel.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.09.22.
//

import UIKit
import SwiftyJSON

struct DetailsEexperimentModel {
    var id: Int
    var name: String
    var description: String
    var photos: [String]
    var sounds: [String]
    var documents: [String]
    var reservation: ReservedModel

    init(json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
        description = json["dascription"].stringValue
        photos = json["photos"].arrayValue.map({$0.stringValue})
        sounds = json["sounds"].arrayValue.map({$0.stringValue})
        documents = json["documents"].arrayValue.map({$0.stringValue})
        reservation = ReservedModel(json: json["reservation"])
    }
}
