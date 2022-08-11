//
//  LoginViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//


import UIKit

class LoginViewController: UIViewController {
    
    var coordinator: LoginCoordinator?
    let baseView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        actionButtons()
        layout()
    }
    
    func actionButtons() {
        baseView.loginButton.addAction { [weak self] in
            guard let self = self else { return }
            
        }
        
        baseView.registerButton.addAction { [weak self] in
            guard let self = self else { return }
            self.coordinator?.toRegister()
        }
    }
    
    func layout() {
        view.addSubview(baseView)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: baseView.topAnchor),
            view.bottomAnchor.constraint(equalTo: baseView.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: baseView.trailingAnchor),
            view.leadingAnchor.constraint(equalTo: baseView.leadingAnchor),
        ])
    }
}
