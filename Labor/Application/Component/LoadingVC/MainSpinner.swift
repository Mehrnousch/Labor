//
//  MainSpinner.swift
//  Labor
//
//  Created by mehrnoush abdinian on 06.08.22.
//

import UIKit

class MainSpinner: UIView {
    
    var isVisible: Bool = false
    
    var spinnerColor: UIColor = UIColor.white {
        didSet {
            spiner.spinnerColor = spinnerColor
        }
    }
    
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    private lazy var spiner: SpinerLayer = {
        let spiner = SpinerLayer(frame: frame, padding: 32)
        spiner.lineWidth = 3
        self.layer.addSublayer(spiner)
        return spiner
    }()
    
    func startSpinner() {
        spiner.animation()
        isVisible = !isVisible
    }
    
    func stopSpinner() {
        isUserInteractionEnabled = true
        spiner.stopAnimation()
        isVisible = !isVisible
        removeFromSuperview()
    }
    
    private func setup(with backgroundColor: UIColor, tintColor: UIColor ) {
        
        self.backgroundColor = backgroundColor
        spiner.spinnerColor = tintColor
        
        translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds  = true
        startSpinner()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup(with: UIColor.white, tintColor: AppTheme.view.backGround_red_color)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.spiner.setToFrame(frame)
        
        layer.cornerRadius = bounds.height / 4
    }
}
