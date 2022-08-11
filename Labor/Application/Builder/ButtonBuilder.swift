//
//  ButtonBuilder.swift
//  Labor
//
//  Created by mehrnoush abdinian on 08.08.22.
//


import UIKit

class ButtonBuilder {
    let button: LoadingButton
    
    init() {
        self.button = LoadingButton()
        commonInit()
    }
    
    func commonInit() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.adjustsImageWhenHighlighted = false
    }
    
    @discardableResult
    func setFrame(width: CGFloat, height: CGFloat) -> ButtonBuilder {
        self.button.frame = CGRect(x: 0, y: 0, width: width, height: height)
        return self
    }
    
    @discardableResult
    func setTitle(_ text: String, color: UIColor, fontSize: CGFloat = AppTheme.label.minimumSize, fontWeight: FontWeight = .regular) -> ButtonBuilder {
        self.button.titleLabel?.font = UIFont.appPrimaryFontWith(size: fontSize, weight: fontWeight)
        self.button.setTitleColor(color, for: .normal)
        self.button.setTitle(text, for: .normal)
        self.button.titleLabel?.numberOfLines = 1
        self.button.sizeToFit()
        return self
    }
    
    @discardableResult
    func setBackground(_ color: UIColor) -> ButtonBuilder {
        self.button.backgroundColor = color
        return self
    }
    
    @discardableResult
    func setBorder(borderWidth: CGFloat = AppTheme.button.borderWidth, borderColor: String = "normal_main_textField_border_color") -> ButtonBuilder {
        self.button.layer.borderWidth = borderWidth
        self.button.layer.borderColor = UIColor(named: borderColor)?.cgColor
        return self
    }
    
    @discardableResult
    func setShadow(color: UIColor) -> ButtonBuilder {
        Utility.addShadow(to: button.layer, color: color)
        return self
    }
    
    @discardableResult
    func setCornerRadius(_ radius: CGFloat) -> ButtonBuilder {
        self.button.layer.cornerRadius = radius
        return self
    }
    
    @discardableResult
    func creatCircleButton() -> ButtonBuilder {
        self.button.layer.cornerRadius = button.frame.size.width / 2
        return self
    }
    
    @discardableResult
    func isHidden(_ bool: Bool) -> ButtonBuilder {
        self.button.isHidden = bool
        return self
    }
    
    func isUserInteraction(_ bool: Bool) -> ButtonBuilder {
        self.button.isUserInteractionEnabled = bool
        return self
    }
    
    @discardableResult
    func setAlpha(_ cgFloat: CGFloat) -> ButtonBuilder {
        self.button.alpha = cgFloat
        return self
    }
    
    @discardableResult
    func setImage(_ image: UIImage) -> ButtonBuilder {
//        self.button.backgroundColor = .clear
        self.button.tintColor = .darkGray
        self.button.setImage(image, for: .normal)
        return self
    }
    
    @discardableResult
    func setImage(_ name: String) -> ButtonBuilder {
//        self.button.backgroundColor = .clear
        self.button.tintColor = .darkGray
        self.button.setImage(UIImage(named: name), for: .normal)
        return self
    }
    
    @discardableResult
    func sideIcon(_ icon: UIImage, width: CGFloat, height: CGFloat, padding: CGFloat) -> ButtonBuilder {
        
        let imageView: UIImageView = ImageBuilder().setImage(icon).build()
        
        button.addSubview(imageView)
        imageView.anchor(leading: button.leadingAnchor, paddingLeft: padding, width: width, height: height, centerY: button.centerYAnchor)
        
        return self
    }
    
    @discardableResult
    func addGradientLayer(_ colors: [CGColor]) -> ButtonBuilder {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = button.bounds
        gradientLayer.colors = colors
        gradientLayer.locations = [1, 0]
        button.layer.addSublayer(gradientLayer)
        return self
    }
    
    @discardableResult
    func clipsToBounds() -> ButtonBuilder {
        self.button.clipsToBounds = true
        return self
    }
    
    func build() -> LoadingButton {
        return button
    }
}

