//
//  MessageModel.swift
//  Labor
//
//  Created by mehrnoush abdinian on 10.09.22.
//

import Foundation
import SwiftyJSON

struct MessageModel {
    var code: String
    var text: String

    init(json: JSON) {
        code = json["code"].stringValue
        text = json["text"].stringValue
    }
}
