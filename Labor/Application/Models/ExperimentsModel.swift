//
//  ExperimentsModel.swift
//  Labor
//
//  Created by mehrnoush abdinian on 04.09.22.
//

import UIKit
import SwiftyJSON

struct ExperimentsModel {
    var experiments: [ExperimentModel]?
    
    init(json: JSON) {
        experiments = json["experiments"].arrayValue.map({ExperimentModel(json: $0)})
    }
}

struct ExperimentModel {
    var id: Int
    var name: String
    var dascription: String

    init(json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
        dascription = json["dascription"].stringValue
    }
}
