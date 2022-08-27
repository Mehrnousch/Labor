//
//  RegisterViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var coordinator: RegisterCoordinator?
    private lazy var viewModel: RegisterViewModel = {
        let vm = RegisterViewModel()
        vm.delegate = self
        return vm
    }()
    let baseView = RegisterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        actionButtons()
    }
    
    func actionButtons() {
        baseView.registerButton.addAction { [weak self] in
            guard let self = self else { return }
            
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


//MARK: - Delegate
extension RegisterViewController: RegisterViewModelDelegate {
    func registerSuccess(successMessage: String) {
        print(successMessage)
    }
    
    func registerFailed() {
        
    }
}
