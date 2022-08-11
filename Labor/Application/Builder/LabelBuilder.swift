//
//  LabelBuilder.swift
//  Labor
//
//  Created by mehrnoush abdinian on 08.08.22.
//

import UIKit

class LabelBuilder {
    
    let label: UILabel
    
    init() {
        self.label = UILabel()
        commonInit()
    }
    
    func commonInit() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.alpha = 1
    }
    
    @discardableResult
    func setText(_ text: String = "", color: UIColor = .clear, fontSize: CGFloat = 18, fontWeight: FontWeight) -> LabelBuilder {
        label.font = UIFont.appPrimaryFontWith(size: fontSize, weight: fontWeight)
        label.textColor = color
        label.text = text
        label.numberOfLines = 0
        return self
    }
    
    @discardableResult
    func setAlignment(_ alignment: NSTextAlignment) -> LabelBuilder {
        self.label.textAlignment = alignment
        return self
    }
    
    @discardableResult
    func setBackground(_ color: UIColor) -> LabelBuilder {
        self.label.backgroundColor = color
        return self
    }
    
    @discardableResult
    func setCornerRadius(_ radius: CGFloat) -> LabelBuilder {
        self.label.layer.cornerRadius = radius
        return self
    }
    
    @discardableResult
    func setBorder(_ width: CGFloat = 3, color: UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)) -> LabelBuilder {
        self.label.layer.borderWidth = width
        self.label.layer.borderColor = color.cgColor
        return self
    }
    
    @discardableResult
    func isHidden(_ bool: Bool) -> LabelBuilder {
        self.label.isHidden = bool
        return self
    }
    
    @discardableResult
    func setAlpha(_ alpha: CGFloat) -> LabelBuilder {
        self.label.alpha = alpha
        return self
    }
    
    func build() -> UILabel {
        return label
    }
}
