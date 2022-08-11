//
//  TextFieldBuilder.swift
//  Labor
//
//  Created by mehrnoush abdinian on 09.08.22.
//

import UIKit

class TextFieldBuilder {
    
    let textfield: PaddingTextField
    
    var returnAction : ()-> Void = { }
    
    init() {
        self.textfield = PaddingTextField()
        commonInit()
    }
    
    func commonInit() {
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.clipsToBounds = true
        textfield.font = UIFont.appPrimaryFontWith(size: 16, weight: .regular)
    }
    
    @discardableResult
    func settingCorner(corner: Int) -> TextFieldBuilder {
        textfield.layer.cornerRadius = CGFloat(corner)
        return self
    }
    
    @discardableResult
    func mainSetting(keyboardType: UIKeyboardType, radius: CGFloat = AppTheme.textField.cornerRadius, placeholder: String, textAlignment: NSTextAlignment, textColor: UIColor = .clear, backGroundColor: UIColor) -> TextFieldBuilder {
        self.textfield.layer.cornerRadius = radius
        self.textfield.keyboardType = keyboardType
        self.textfield.placeholder = placeholder
        self.textfield.textAlignment = textAlignment
        self.textfield.textColor = textColor
        self.textfield.backgroundColor = backGroundColor
        return self
    }
    
    @discardableResult
    func setBorderDeselected() -> TextFieldBuilder {
        self.textfield.layer.borderWidth = AppTheme.textField.borderWidth
        self.textfield.layer.borderColor = AppTheme.textField.borderColor.cgColor
        return self
    }
    
    @discardableResult
    func setBorderSelected() -> TextFieldBuilder {
        self.textfield.layer.borderWidth = AppTheme.textField.borderWidth
        self.textfield.layer.borderColor = UIColor(named: "select_main_textField_border_color")?.cgColor
        return self
    }
    
    @discardableResult
    func setShadow() -> TextFieldBuilder {
        self.textfield.layer.shadowColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.12).cgColor
        self.textfield.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        self.textfield.layer.shadowOpacity = 0.9
        self.textfield.layer.shadowRadius = 6.0
        self.textfield.layer.masksToBounds = false
        return self
    }
    
    @discardableResult
    func sideIcon(_ icon: UIImage, width: CGFloat, height: CGFloat, padding: CGFloat) -> TextFieldBuilder {
        let imageTextField: UIImageView = ImageBuilder().setImage(icon).build()
        
        textfield.addSubview(imageTextField)
        imageTextField.anchor(leading: textfield.leadingAnchor, paddingLeft: padding, width: width, height: height, centerY: textfield.centerYAnchor)
        textfield.padding = UIEdgeInsets(top: 0, left: 56, bottom: 0, right: 24)
        return self
    }
    
    @discardableResult
    func setClear() -> TextFieldBuilder {
        return self
    }
    
    func build() -> UITextField {
        return self.textfield
    }
}

extension TextFieldBuilder {
    
    func clearMode() -> TextFieldBuilder {
        self.textfield.clearButtonMode = .always
        return self
    }
}
