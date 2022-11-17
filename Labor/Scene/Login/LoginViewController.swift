//
//  LoginViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//


import UIKit
import Toast

class LoginViewController: UIViewController {
    
    var chosenEyeSlash = false
    var chosenEye = false
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var coordinator: LoginCoordinator?
    private lazy var viewModel: LoginViewModel = {
        let vm = LoginViewModel()
        vm.delegate = self
        return vm
    }()
    let baseView = LoginView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //MARK: - Get Notification RegisterSuccessful
        NotificationCenter.default.addObserver(self, selector: #selector(showToastRegister), name: NSNotification.Name ("RegisterSuccessful"), object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        actionButtons()
        layout()
    }
    
    @objc func showToastRegister() {
        let toast = Toast.default(
            image: UIImage(named: "success")!,
            title: "Register",
            subtitle: "Register successfully."
        )
        toast.show()
    }
    
    func actionButtons() {
        baseView.loginButton.addAction { [weak self] in
            guard let self = self else { return }
            if let email = self.baseView.emailTextField.text, let password = self.baseView.passwordTextField.text, let deviceName = UIDevice.current.identifierForVendor?.uuidString {
                if email != "", password != "", deviceName != "" {
                    self.viewModel.login(email: email, password: password, deviceName: deviceName)
                    print("deviceName = \(deviceName)")
                } else {
                    Toast.text("Bitte überprüfen Sie, ob Benutzername und Passwort korrekt eingegeben wurden.").show()
                }
            }
        }
        
        baseView.registerButton.addAction { [weak self] in
            guard let self = self else { return }
            self.coordinator?.toRegister()
        }
        
//        baseView.hiddenButton.addAction {[weak self] in
//            guard let self = self else { return }
//            if let secureTextEntry == true {
//                secureTextEntry = false
//            } else {
//                secureTextEntry = true
//            }
//            
//        }

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


//MARK: - ViewModelDelegate
extension LoginViewController: LoginViewModelDelegate {
    
    func loginSuccess(newToken: String) {
        
//        let lastToken = DB.last?.token
//        if lastToken == "" || lastToken?.isEmpty == true || lastToken == nil {
////            saveToken(token: newToken)
//            KeyChainStorage.save(token: newToken)
//        } else {
//            updateToken(item: DB.last!, newToken: newToken)
//        }
        
        KeyChainStorage.save(token: newToken)
        
        self.coordinator?.toReservedExperiment()
    }
    
    func loginFailed(errorMessages: [String]) {
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
