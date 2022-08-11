//
//  LoadingViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 03.08.22.
//

import UIKit

class LoadingViewController: UIViewController {

    lazy var spinnerBaseView = LoadingView(frame: view.frame)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(spinnerBaseView)
        NSLayoutConstraint.activate([
            spinnerBaseView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinnerBaseView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            spinnerBaseView.widthAnchor.constraint(equalTo: view.widthAnchor),
            spinnerBaseView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
        // Do any additional setup after loading the view.
        modalPresentationStyle = .overCurrentContext
        startLoading()
    }
    
    func startLoading() {
        spinnerBaseView.startSpinnerAnimation()
    }
    
    func dismiss(completion: @escaping()-> Void) {
        spinnerBaseView.stopSpinnerAnimation {
            self.dismiss(animated: false) {
                completion()
            }
        }
    }
}
