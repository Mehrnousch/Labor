//
//  AppTheme.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//

import UIKit

public enum AppTheme {
    static var primary_font = "Roboto"
    static let borderWidth: CGFloat = 1
    static let backGround_color: UIColor = .init(red: 181/255, green: 42/255, blue: 41/255, alpha: 1)
    static let fixedBottomView_corner: CGFloat = 30
    static let link_text_color: UIColor = UIColor(red: 0, green: 119/255, blue: 204/255, alpha: 1)
    static let gray_color: UIColor = UIColor(red: 166/255, green: 166/255, blue: 166/255, alpha: 1)
    
    enum main_textField_button {
        static let height: CGFloat = 52
        static let cornerRadius: CGFloat = 12
        static let borderWidth: CGFloat = 1
        static let borderColor: UIColor = UIColor.init(red: 218/255, green: 218/255, blue: 218/255, alpha: 1)
    }
    
}
