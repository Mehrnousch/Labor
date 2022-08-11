//
//  ViewBuilder.swift
//  Labor
//
//  Created by mehrnoush abdinian on 08.08.22.
//


import UIKit

class ViewBuilder {
    
    let view: UIView
    
    init() {
        self.view = UIView()
        commonInit()
    }
    
    func commonInit() {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @discardableResult
    func setBackground(_ color: UIColor, alpha: CGFloat? = nil) -> ViewBuilder {
        if let alpha = alpha {
            self.view.backgroundColor = color.withAlphaComponent(alpha)
        } else {
            self.view.backgroundColor = color
        }
        return self
    }
    
    @discardableResult
    func borderColor(_ color: UIColor, borderWidth: CGFloat = AppTheme.view.borderWidth) -> ViewBuilder {
        self.view.layer.borderColor = color.cgColor
        self.view.layer.borderWidth = borderWidth
        return self
    }
    
    @discardableResult
    func setAlpha(_ alpha: CGFloat) -> ViewBuilder {
        self.view.alpha = alpha
        return self
    }
    
    @discardableResult
    func setCornerRadius(_ radius: CGFloat, onlyTop: Bool = false, onlyBottom: Bool = false) -> ViewBuilder {
        self.view.layer.cornerRadius = radius
        if onlyTop {
            self.view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        }
        if onlyBottom {
            self.view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        return self
    }
    
    @discardableResult
    func clipsToBounds() -> ViewBuilder {
        self.view.clipsToBounds = true
        return self
    }
    
    func build() -> UIView {
        return view
    }
}
