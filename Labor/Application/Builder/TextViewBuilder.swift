//
//  TextViewBuilder.swift
//  Labor
//
//  Created by mehrnoush abdinian on 09.08.22.
//

import UIKit

class TextViewBuilder {
    
    let textview: UITextView
    
    init() {
        self.textview = UITextView()
        commonInit()
    }
    
    func commonInit() {
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.isEditable = true
        textview.isSelectable = true
        textview.isScrollEnabled = true
        textview.isUserInteractionEnabled = true
        textview.clipsToBounds = true
        textview.backgroundColor = .white
        textview.textContainerInset = .init(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    @discardableResult
    func setBorder() -> TextViewBuilder {
        textview.layer.cornerRadius = AppTheme.textField.cornerRadius
        textview.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.04).cgColor
        textview.layer.shadowOpacity = 1
        textview.layer.shadowRadius = 24
        textview.layer.shadowOffset = CGSize(width: 0, height: 4)
        textview.layer.borderWidth = CGFloat(AppTheme.textField.borderWidth)
        textview.layer.borderColor = AppTheme.textField.borderColor.cgColor
        return self
    }
    
    @discardableResult
    func isSelectable(_ bool: Bool) -> TextViewBuilder {
        self.textview.isSelectable = bool
        return self
    }
    
    @discardableResult
    func setText(_ text: String, color: UIColor = UIColor(named: "black") ?? .black, fontSize: CGFloat = AppTheme.label.normalSize, fontWeight: FontWeight = .regular) -> TextViewBuilder {
        self.textview.font = UIFont.appPrimaryFontWith(size: fontSize, weight: fontWeight)
        self.textview.textColor = color
        self.textview.text = text
        return self
    }
    
    @discardableResult
    func setAlignment(_ alignment: NSTextAlignment) -> TextViewBuilder {
        self.textview.textAlignment = alignment
        return self
    }
    
    @discardableResult
    func setHyperLink(with text: String, hyperLink: String, url: String) -> TextViewBuilder {
        self.textview.hyperLink(originalText: text, hyperLink: hyperLink, urlString: url)
        return self
    }
    
    func build() -> UITextView {
        return textview
    }
}

