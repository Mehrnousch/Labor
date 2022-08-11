//
//  String.swift
//  Labor
//
//  Created by mehrnoush abdinian on 09.08.22.
//

import UIKit

extension String {
    
    func decodeBase64()-> String {
        let decodedData = Data(base64Encoded: self)!
        let decodedString = String(data: decodedData, encoding: .utf8)!
        
        print(decodedString)
        return decodedString
    }
    
    func formatPhoneNumber()-> String {
        let string = removeNonNummericCharacters()
        if string.count < 3 { return string }
        if string.subString(from: 0, to: 2) == "+98" {
            return string.subString(from: 3, to: string.count - 1)
        }
        if string.subString(from: 0, to: 3) == "0098" {
            return string.subString(from: 4, to: string.count - 1)
        }
        else if string.subString(from: 0, to: 0) == "0" {
            return string.subString(from: 1, to: string.count - 1)
        }
        else if string.subString(from: 0, to: 0) == "+" {
            return string.subString(from: 1, to: string.count - 1)
        }
        return string
    }
    
    /// Convert english numbers in string to persian format
    func toPersian()-> String {
        let numbersDictionary : Dictionary = ["0" : "۰", "1" : "۱", "2" : "۲", "3" : "۳", "4" : "۴", "5" : "۵", "6" : "۶", "7" : "۷", "8" : "۸", "9" : "۹"]
        var str : String = self
        
        for (key,value) in numbersDictionary {
            str =  str.replacingOccurrences(of: key, with: value)
        }
        
        return str
    }
    
    /// Convert english numbers in string to kurdish format
    func toKurdish()-> String {
        let numbersDictionary : Dictionary = ["0" : "٠", "1" : "١", "2" : "٢", "3" : "٣", "4" : "٤", "5" : "٥", "6" : "٦", "7" : "٧", "8" : "٨", "9" : "٩"]
        var str : String = self
        
        for (key,value) in numbersDictionary {
            str =  str.replacingOccurrences(of: key, with: value)
        }
        
        return str
    }
    
    func toEnglishNumbers()-> String {
        var numbersDictionary : Dictionary<String, String>!
        numbersDictionary = ["۰" : "0", "۱" : "1", "۲" : "2", "۳" : "3", "۴" : "4", "۵" : "5", "۶" : "6", "۷" : "7", "۸" : "8", "۹" : "9",  "٤" : "4", "٥" : "5", "٦" : "6","١":"1","٢":"2","":"1","٣":"3","٧":"7","٨":"8","٩":"9","٠":"0",]
        var str : String = self
        
        for (key,value) in numbersDictionary {
            str =  str.replacingOccurrences(of: key, with: value)
        }
        return str
    }
    
    /// Convert persian numbers in string to english format
    func normalizeToEnglish()-> String {
        let numbersDictionary : Dictionary<String, String>!
        
        switch Utility.getCurrentLanguage() {
        case "FA":
            numbersDictionary = ["۰" : "0", "۱" : "1", "۲" : "2", "۳" : "3", "۴" : "4", "۵" : "5", "۶" : "6", "۷" : "7", "۸" : "8", "۹" : "9"]
            
        case "KU":
            numbersDictionary = ["٠" : "0", "١" : "1", "٢" : "2", "٣" : "3", "٤" : "4", "٥" : "5", "٦" : "6", "٧" : "7", "٨" : "8", "٩" : "9"]
            
        case "AR":
            numbersDictionary = ["٠" : "0", "١" : "1", "٢" : "2", "٣" : "3", "٤" : "4", "٥" : "5", "٦" : "6", "٧" : "7", "٨" : "8", "٩" : "9"]
            
        default:
            return self
        }
        var str : String = self
        
        for (key,value) in numbersDictionary {
            str =  str.replacingOccurrences(of: key, with: value)
        }
        
        return str
    }
    
    /// Equal trick
    func `is`(_ str: String) -> Bool {
        if self == str {
            return true
        }
        return false
    }
    
    
    /// Existance trick
    func `in`(_ strs: [String]) -> Bool {
        if strs.contains(self) {
            return true
        }
        return false
    }
    
    /*
     + Remove character in string
     */
    func removingAll(characters: [Character]) -> String {
        return self.filter({ !characters.contains($0) })
    }
    
    /*
     + Get size of string
     */
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
    
    /*
     + Validate Email Address
     */
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
    /*
     + Remove character in string
     */
    func stringByRemovingAll(characters: [Character]) -> String {
        return self.filter({ !characters.contains($0) })
    }
    
    func trunc(length: Int, trailing: String = "") -> String {
        return (self.count > length) ? self.prefix(length) + trailing : self
    }
    
    func subString(from: Int, to: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: from)
        let endIndex = self.index(self.startIndex, offsetBy: to)
        return String(self[startIndex...endIndex])
    }
    
    func substring(from: Int) -> String {
        _ = index(ofAccessibilityElement: from)
        return String(self[startIndex...])
    }
    
    func removeNonNummericCharacters()-> String {
        return filter("0123456789.".contains)
    }
    
    func removeNonPriceCharacters()-> String {
        return filter("0123456789.,-".contains)
    }
    
    func isoToDate() -> Date? {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        isoDateFormatter.formatOptions = [
            .withFullDate,]
        
        if let realDate = isoDateFormatter.date(from: self) {
            return realDate
        }
        return nil
    }
}
