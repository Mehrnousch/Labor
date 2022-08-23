//
//  AppTheme.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//

import UIKit

public enum AppTheme {
    static var primary_font = "Roboto"

    enum label {
        static let placeHolder_textView: String = "Write a description of the test experience"
        static let link_text_color: UIColor = UIColor(red: 0, green: 119/255, blue: 204/255, alpha: 1)
        static let minimumSize: CGFloat = 14
        static let normalSize: CGFloat = 18
        static let maximumSize: CGFloat = 22
    }
    
    enum view {
        static let backGround_red_color: UIColor = .init(red: 181/255, green: 42/255, blue: 41/255, alpha: 1)
        static let backGround_blue_color: UIColor = .init(red: 192/255, green: 216/255, blue: 237/255, alpha: 1)
        static let fixedBottomView_corner: CGFloat = 30
        static let borderWidth: CGFloat = 1
        static let cornerRadius: CGFloat = 12
        static let backGround_light_gray_color: UIColor = .init(red: 231/255, green: 231/255, blue: 233/255, alpha: 1)
    }
    
    enum cell {
        static let light_gray_color: UIColor = UIColor(red: 231/255, green: 231/255, blue: 233/255, alpha: 1)
        static let corner: CGFloat = 12
    }
    
    enum textField {
        static let height: CGFloat = 52
        static let cornerRadius: CGFloat = 12
        static let borderWidth: CGFloat = 1
        static let borderColor: UIColor = UIColor.init(red: 218/255, green: 218/255, blue: 218/255, alpha: 1)
    }
    
    enum button {
        static let backGround_color: UIColor = .init(red: 181/255, green: 42/255, blue: 41/255, alpha: 1)
        static let dark_gray_color: UIColor = UIColor(red: 166/255, green: 166/255, blue: 166/255, alpha: 1)
        static let height: CGFloat = 52
        static let borderWidth: CGFloat = 1
        static let cornerRadius: CGFloat = 12
        static let hight_width_PdfButton: CGFloat = 44
        static let textView_send: UIColor = .init(red: 110/255, green: 182/255, blue: 196/255, alpha: 1)
    }
    
    enum navigationItem {
        static let red_color: UIColor = .init(red: 181/255, green: 42/255, blue: 41/255, alpha: 1)
        
    }
}






