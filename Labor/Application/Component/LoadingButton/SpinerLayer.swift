//
//  SpinerLayer.swift
//  Labor
//
//  Created by mehrnoush abdinian on 10.08.22.
//

import UIKit

class SpinerLayer: CAShapeLayer {
    
    var spinnerColor = UIColor.gray {
        didSet {
            strokeColor = spinnerColor.cgColor
        }
    }
    
    init(frame: CGRect, padding: CGFloat?) {
        super.init()
        
        var paddingFrame = frame
        if let _ = padding {
            paddingFrame.width -= padding!
            paddingFrame.height -= padding!
        }
        self.setToFrame(paddingFrame)
        
        self.fillColor = nil
        self.strokeColor = spinnerColor.cgColor
        self.lineWidth = 2
        
        self.strokeEnd = 0.4
        self.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
        
    }
    
    func animation() {
        self.isHidden = false
        let rotate = CABasicAnimation(keyPath: "transform.rotation.z")
        rotate.fromValue = 0
        rotate.toValue = Double.pi * 2
        rotate.duration = 0.5
        rotate.timingFunction = CAMediaTimingFunction(name: .linear)
        
        rotate.repeatCount = HUGE
        rotate.fillMode = .forwards
        rotate.isRemovedOnCompletion = false
        self.add(rotate, forKey: rotate.keyPath)
        
    }
    
    func setToFrame(_ frame: CGRect) {
        
        let viewCenter = (frame.width / 2) - (frame.height / 2)
        
        let radius:CGFloat = (frame.height / 2) * 0.7
        self.frame = CGRect(x: viewCenter, y: 0, width: frame.height, height: frame.height)
        let center = CGPoint(x: frame.height / 2, y: bounds.center.y)
        let startAngle = 0 - Double.pi/2
        let endAngle = Double.pi * 4 - Double.pi/2
        let clockwise: Bool = true
        self.path = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: clockwise).cgPath
    }
    
    func stopAnimation() {
        self.isHidden = true
        self.removeAllAnimations()
    }
}



//MARK: - for realoded view

class RealodedSpinerLayer: CAShapeLayer {
    
    var spinnerColor = UIColor.gray {
        didSet {
            strokeColor = spinnerColor.cgColor
        }
    }
    
    init(frame: CGRect, padding: CGFloat?) {
        super.init()
        
        var paddingFrame = frame
        if let _ = padding {
            paddingFrame.width -= padding!
            paddingFrame.height -= padding!
        }
        self.setToFrame(paddingFrame)
        
        self.fillColor = nil
        self.strokeColor = spinnerColor.cgColor
        self.lineWidth = 2
        
        self.strokeEnd = 0.4
        self.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
        
    }
    
    func animation() {
        self.isHidden = false
        let rotate = CABasicAnimation(keyPath: "transform.rotation.z")
        rotate.fromValue = 0
        rotate.toValue = Double.pi * 2
        rotate.duration = 0.5
        rotate.timingFunction = CAMediaTimingFunction(name: .linear)
        
        rotate.repeatCount = HUGE
        rotate.fillMode = .forwards
        rotate.isRemovedOnCompletion = false
        self.add(rotate, forKey: rotate.keyPath)
        
    }
    
    func setToFrame(_ frame: CGRect) {
        
        let viewCenter = (frame.width / 3) - (frame.height / 3)
        
        let radius:CGFloat = (frame.height / 2) * 0.5
        self.frame = CGRect(x: viewCenter, y: 0, width: frame.height, height: frame.height)
        let center = CGPoint(x: frame.height / 2, y: bounds.center.y)
        let startAngle = 0 - Double.pi/2
        let endAngle = Double.pi * 4 - Double.pi/2
        let clockwise: Bool = true
        self.path = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: clockwise).cgPath
    }
    
    func stopAnimation() {
        self.isHidden = true
        self.removeAllAnimations()
    }
}
