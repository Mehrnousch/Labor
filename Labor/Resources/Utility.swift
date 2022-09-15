//
//  Utility.swift
//  Labor
//
//  Created by mehrnoush abdinian on 02.08.22.
//

import UIKit

enum SafeAreaEdge {
    case top
    case bottom
    case right
    case left
}

class Utility {
    
    class func getAppDirection() -> UISemanticContentAttribute {
        return UIView.appearance().semanticContentAttribute
    }
    
    /**
     - Returns
     True => if direction is RTL
     False => if direction is not RTL
     */
    class func isRTL()-> Bool {
        return Utility.getAppDirection() == .forceRightToLeft
    }
    
    
    /// Get safe area edge height for responsive design
    class func getSafeAreaHeight(for edge: SafeAreaEdge) -> CGFloat {
        if #available(iOS 11.0, *) {
            
            guard let window = UIApplication.shared.keyWindow else {
                return 0.0
            }
            
            switch edge {
            case .top:
                return window.safeAreaInsets.top
            case .bottom:
                return window.safeAreaInsets.bottom
            case .left:
                return window.safeAreaInsets.left
            case .right:
                return window.safeAreaInsets.right
            }
        }
        return 0.0
    }
    
    
    /// Get current lang
    class func getCurrentLanguage() -> String {
        return "EN"
    }
    
    
    class func getCurrentLocale() -> Locale {
        return NSLocale(localeIdentifier: (Utility.getCurrentLanguage() == "FA") ? "fa_IR" : "en_US") as Locale
    }
    
    
    class func ISODateStringToDate(dateString: String) -> Date? {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        isoDateFormatter.formatOptions = [
            .withFullDate, .withFullTime]
        
        if let realDate = isoDateFormatter.date(from: dateString) {
            return realDate
        }
        return nil
    }
    
    
    class func formatISODate(dateString: String) -> String {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        isoDateFormatter.formatOptions = [
            .withFullDate,]
        
        if let realDate = isoDateFormatter.date(from: dateString) {
            print("Got it: \(realDate)")
            return realDate.string(format: "yyyy-MM-dd").normalizeToEnglish().replacingOccurrences(of: "-", with: "/")
        }
        return ""
    }
    
    
    class func formatISOTime(dateString: String) -> String {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = TimeZone.current
        isoDateFormatter.formatOptions =  [
            .withFullDate,
            .withFullTime,
            .withDashSeparatorInDate,
            .withFractionalSeconds]
        
        
        if let realDate = isoDateFormatter.date(from: dateString) {
            print("Got it: \(realDate)")
            return timeFormat(realDate)
        }
        return ""
    }
    
    
    /// Date Formatter
    class func dateFormat(unixtimeInterval: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: unixtimeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = getCurrentLocale()
        dateFormatter.calendar = Calendar(identifier: (getCurrentLanguage() == "FA") ? .persian : .gregorian)
        dateFormatter.dateFormat = (getCurrentLanguage() == "FA") ? "d MMM yyyy" : "MMM dd, yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    
    class func timeFormatter(_ timestamp: TimeInterval, includSeconds: Bool = false) -> String {
        var calendar = Calendar.current
        calendar.locale = Utility.isRTL() ? Locale(identifier: "fa_IR") : Locale(identifier: "en_US")
        let formatter = DateComponentsFormatter()
        formatter.calendar = calendar
        if includSeconds {
            formatter.allowedUnits = [.hour, .minute, .second]
        } else {
            formatter.allowedUnits = [.hour, .minute]
        }
        
        formatter.unitsStyle = .abbreviated
        guard let formattedString = formatter.string(from: timestamp) else { return "" }
        return formattedString
    }
    
    
    /// Time formatter
    class func timeFormat(_ time: Date) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = getCurrentLocale()
        return dateFormatter.string(from: time)
    }
    
    
    class func addShadow(to layer: CALayer, color: UIColor) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 1
        layer.shadowRadius = 24
        layer.masksToBounds = false
    }
    

    class func addDeepShadow(to layer: CALayer) {
        layer.shadowColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.18).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowOpacity = 0.9
        layer.shadowRadius = 2.0
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
        let offsetInSeconds = -10800
        let unixTimeBerlin = unixTime + Double(offsetInSeconds)
        let date = NSDate(timeIntervalSince1970: unixTimeBerlin)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date as Date)
    }
}
