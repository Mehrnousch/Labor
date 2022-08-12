//
//  LoginCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//

import UIKit

protocol LoginCoordinatorDelegate {
    func toRegister()
}

class LoginCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = LoginViewController()
    private var registerCoordinator: RegisterCoordinator?

    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        VC.coordinator = self
        navigate(to: VC, with: .push)
    }
}

//MARK: - Delegate
extension LoginCoordinator: LoginCoordinatorDelegate {
    func toRegister() {
        registerCoordinator = RegisterCoordinator(with: navigationController)
        registerCoordinator?.start()
    }
}
