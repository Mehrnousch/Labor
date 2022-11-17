//
//  RegisterViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//

import UIKit
import Toast

class RegisterViewController: UIViewController {
    
    private let notificationCenter = NotificationCenter.default

    var coordinator: RegisterCoordinator?
    private lazy var viewModel: RegisterViewModel = {
        let vm = RegisterViewModel()
        vm.delegate = self
        return vm
    }()
    let baseView = RegisterView()
    var registerSuccessful = false

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        actionButtons()
    }
    
    func actionButtons() {
        baseView.registerButton.addAction { [weak self] in
            guard let self = self else { return }
            if let name = self.baseView.nameTextField.text, let email = self.baseView.emailTextField.text, let password = self.baseView.passwordTextField.text {
                if name != "", email != "", password != "" {
                    self.viewModel.register(fullName: name, email: email, password: password)
                } else {
                    Toast.text("Bitte füllen Sie alle Abschnitte aus.").show()
                }
            }
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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if registerSuccessful {
            //MARK: - Post Notification RegisterSuccessful
            notificationCenter.post(name: NSNotification.Name("RegisterSuccessful"), object: nil, userInfo: nil)
        }
    }
    
    //MARK: - Remove Notification RegisterSuccessful
    deinit {
        notificationCenter.removeObserver(self, name: NSNotification.Name("RegisterSuccessful"), object: nil)
    }
}


//MARK: - ViewModelDelegate
extension RegisterViewController: RegisterViewModelDelegate {
    
    func registerSuccess() {
        self.registerSuccessful = true
        self.dismiss(animated: true)
    }
    
    func registerFailed(errorMessages: [String]) {
        if errorMessages.count == 1 {
            let toast = Toast.default(
                image: UIImage(named: "error")!,
                title: "Register",
                subtitle: errorMessages[0]
            )
            toast.show()
        } else if errorMessages.count > 0 {
            let toast = Toast.default(
                image: UIImage(named: "error")!,
                title: "Register",
                subtitle: "You entered the wrong email or password."
            )
            toast.show()
        }
    }
}
