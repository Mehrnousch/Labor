//
//  LoadingView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 03.08.22.
//

import UIKit

class LoadingView: UIView {

    let spinner: MainSpinner = MainSpinner()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    func config() {
        self.alpha = 0
        addSubview(spinner)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.white
    }
    
    func startSpinnerAnimation() {
        let fadeInAnimation = UIViewPropertyAnimator(duration: 0.15, curve: .easeOut) {
            self.alpha = 1
        }
        fadeInAnimation.startAnimation()
    }
    
    func stopSpinnerAnimation(finishAnimation: @escaping ()-> Void) {
        let fadeOutAnimation = UIViewPropertyAnimator(duration: 0.15, curve: .easeIn) {
            self.alpha = 0
        }
        
        fadeOutAnimation.addCompletion { _ in
            self.isHidden = true
            finishAnimation()
        }
        
        fadeOutAnimation.startAnimation()
    }
    
    func layout() {
        addSubview(spinner)
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 70),
            spinner.heightAnchor.constraint(equalToConstant: 70),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
