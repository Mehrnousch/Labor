//
//  Utility.swift
//  Labor
//
//  Created by mehrnoush abdinian on 02.08.22.
//

import UIKit

class Utility {
    
    class func addShadow(to layer: CALayer, color: UIColor) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 1
        layer.shadowRadius = 24
        layer.masksToBounds = false
    }
    
    class func dateStringFromUnixTime(unixTime: Double) -> String {
        let offsetInSeconds = -10800
        let unixTimeBerlin = unixTime + Double(offsetInSeconds)
        let date = NSDate(timeIntervalSince1970: unixTimeBerlin)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return dateFormatter.string(from: date as Date)
    }
    
    class func timeStringFromUnixTime(unixTime: Double) -> String {
        let offsetInSeconds = -3600
        let unixTimeBerlin = unixTime + Double(offsetInSeconds)
        let date = NSDate(timeIntervalSince1970: unixTimeBerlin)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date as Date)
    }
}
