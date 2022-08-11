//
//  LoadingButton.swift
//  Labor
//
//  Created by mehrnoush abdinian on 09.08.22.
//

import UIKit

class LoadingButton: UIButton {
    
    var isCanceling: Bool = false
    
    let backLayer = CALayer()
    
    // the color of the spinner while animating the button
    var spinnerColor: UIColor = UIColor.white {
        didSet {
            spiner.spinnerColor = spinnerColor
        }
    }
    
    // the background of the button in disabled state
    var disabledBackgroundColor: UIColor = UIColor.lightGray {
        didSet {
            //self.setBackgroundImage(UIImage(color: disabledBackgroundColor), for: .disabled)
        }
    }
    
    
    private lazy var spiner: SpinerLayer = {
        let spiner = SpinerLayer(frame: self.frame, padding: 0)
        self.layer.addSublayer(spiner)
        return spiner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.spiner.setToFrame(self.frame)
    }
    
    private func setup() {
        self.clipsToBounds  = true
        spiner.spinnerColor = spinnerColor
    }
    
    // start Spinner
    private func makeCoverLayer(backGroundColor: UIColor) {
        backLayer.frame = bounds
        backLayer.cornerRadius = layer.cornerRadius
        backLayer.backgroundColor = backGroundColor.cgColor
        backLayer.isHidden = false
        backLayer.addSublayer(spiner)
    }
    
    private func hideCoverLayer() {
        backLayer.isHidden = true
    }
    
    func startLoading(backGroundColor: UIColor) {
        self.isUserInteractionEnabled = false
        isCanceling = true
        
        makeCoverLayer(backGroundColor: backGroundColor)
        layer.addSublayer(backLayer)
        
        self.spiner.animation()
    }
    
    // Stop Spinner
    func stopLoading() {
        self.isUserInteractionEnabled = true
        isCanceling = false
        
        hideCoverLayer()
        self.spiner.stopAnimation()
        
        HapticGenerator.instance.notification(.success)
    }
}
