//
//  UIFont.swift
//  Labor
//
//  Created by mehrnoush abdinian on 09.08.22.
//

import UIKit

enum FontWeight {
    case regular
    case light
    case bold
    case medium
}

extension UIFont {
    class func appPrimaryFontWith(size: CGFloat, weight: FontWeight) -> UIFont {
        switch weight {
        case .regular:
            return UIFont(name:"\(AppTheme.primary_font)-Regular", size: size)!
        case .light:
            return UIFont(name: "\(AppTheme.primary_font)-Light", size: size)!
        case .bold:
            return UIFont(name: "\(AppTheme.primary_font)-Bold", size: size)!
        case .medium:
            return UIFont(name: "\(AppTheme.primary_font)-Medium", size: size)!
        }
    }
}
