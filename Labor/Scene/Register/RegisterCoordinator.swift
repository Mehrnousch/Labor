//
//  RegisterCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//

import UIKit

protocol RegisterCoordinatorDelegate {
    
}

class RegisterCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = RegisterViewController()
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        VC.coordinator = self
        navigate(to: VC, with: .push)
    }
}

//MARK: - Delegate
extension RegisterCoordinator: RegisterCoordinatorDelegate {

}
