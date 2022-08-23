//
//  UIView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 09.08.22.
//

import UIKit

extension UIView {
    
    func addDashedBorder() {
        let color = UIColor(red: 200/255, green: 200/255, blue: 220/255, alpha: 1).cgColor
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 1
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [8,6]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 20).cgPath

        self.layer.addSublayer(shapeLayer)
    }
    
    func pin(to superView: UIView, onKeyboard: Bool = false) {
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        if (onKeyboard) {
            bottomAnchor.constraint(equalTo: superView.keyboardLayoutGuide.topAnchor).isActive = true
        } else {
            bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        }
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                leading: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0.0,
                paddingLeft: CGFloat = 0.0,
                paddingRight: CGFloat = 0.0,
                paddingBottom: CGFloat = 0.0,
                width: CGFloat = 0.0,
                height: CGFloat = 0.0,
                centerX: NSLayoutXAxisAnchor? = nil,
                centerY: NSLayoutYAxisAnchor? = nil,
                heightMultiplierAnchor: NSLayoutDimension? = nil,
                heightMultiplierFloat: CGFloat = 1.0,
                widthMultiplierAnchor: NSLayoutDimension? = nil,
                widthMultiplierFloat: CGFloat = 1.0,
                reliefSafeArea: Bool = false
    ) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingRight).isActive = true
        }
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX, constant: paddingLeft).isActive = true
        }
        
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY, constant: paddingTop).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let heightMultiplierAnchor = heightMultiplierAnchor {
            heightAnchor.constraint(equalTo: heightMultiplierAnchor, multiplier: heightMultiplierFloat).isActive = true
        }
        
        if let widthMultiplierAnchor = widthMultiplierAnchor {
            widthAnchor.constraint(equalTo: widthMultiplierAnchor, multiplier: widthMultiplierFloat).isActive = true
        }
        
        if height != 0 {
            
            if #available(iOS 11.0, *), bottom != nil, reliefSafeArea {
                
                let window = UIApplication.shared.keyWindow
                let bottomPadding = window?.safeAreaInsets.bottom ?? 0
                
                heightAnchor.constraint(equalToConstant: height + bottomPadding).isActive = true
                
                return
            }
            
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func shadow() {
        layer.masksToBounds = false
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.8
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0 , height: 4)
      }
}
