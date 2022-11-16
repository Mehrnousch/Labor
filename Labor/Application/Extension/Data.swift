//
//  Data.swift
//  Labor
//
//  Created by mehrnoush abdinian on 10.08.22.
//

import UIKit

extension Date {
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
