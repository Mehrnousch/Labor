//
//  LabModel.swift
//  Labor
//
//  Created by mehrnoush abdinian on 03.09.22.
//

import Foundation
import SwiftyJSON

struct LabsModel {
    var data: [LabModel]?
    
    init(json: JSON) {
        data = json["data"].arrayValue.map({LabModel(json: $0)})
    }
}

struct LabModel {
    var id: Int
    var name: String

    init(json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
    }
}
