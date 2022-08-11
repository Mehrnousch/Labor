//
//  RegisterViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var coordinator: RegisterCoordinator?
    let baseView = RegisterView()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
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
