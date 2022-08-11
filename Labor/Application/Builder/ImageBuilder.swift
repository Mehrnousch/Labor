//
//  ImageBuilder.swift
//  Labor
//
//  Created by mehrnoush abdinian on 08.08.22.
//

import UIKit

class ImageBuilder {
    
    let imageView: UIImageView
    
    init() {
        self.imageView = UIImageView()
        commonInit()
    }
    
    func commonInit() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.clipsToBounds = true
    }
    
    @discardableResult
    func setBackground(_ color: UIColor) -> ImageBuilder {
        self.imageView.backgroundColor = color
        return self
    }
    
    @discardableResult
    func setAlpha(_ cgFloat: CGFloat) -> ImageBuilder {
        self.imageView.alpha = cgFloat
        return self
    }
    
    @discardableResult
    func setImage(_ image: UIImage) -> ImageBuilder {
        self.imageView.image = image
        return self
    }
    
    @discardableResult
    func setImage(_ name: String) -> ImageBuilder {
        self.imageView.backgroundColor = .clear
        self.imageView.tintColor = .darkGray
        self.imageView.image = UIImage(named: name)
        return self
    }
    
    @discardableResult
    func setCornerRadius(_ radius: CGFloat) -> ImageBuilder {
        self.imageView.layer.cornerRadius = radius
        return self
    }
    
    /// for resizing image
    @discardableResult
    func scaleAspectFit() -> ImageBuilder {
        self.imageView.contentMode = .scaleAspectFit
        return self
    }
    
    @discardableResult
    func scaleAspectFill() -> ImageBuilder {
        self.imageView.contentMode = .scaleAspectFill
        return self
    }
    
    func build() -> UIImageView {
        return imageView
    }
}
