//
//  PhotosModel.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.09.22.
//

import UIKit
import SwiftyJSON

struct PhotosModel {
    var photos: [PhotoModel]?
    
    init(json: JSON) {
        photos = json["photos"].arrayValue.map({PhotoModel(json: $0)})
    }
}

struct PhotoModel {
    var id: Int

    init(json: JSON) {
        id = json["id"].intValue
    }
}

