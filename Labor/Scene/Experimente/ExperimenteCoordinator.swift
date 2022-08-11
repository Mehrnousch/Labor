//
//  ExperimenteCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//


import UIKit

protocol ExperimenteCoordinatorDelegate {
}

class ExperimenteCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = ExperimenteViewController()

    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        VC.coordinator = self
        navigate(to: VC, with: .push)
    }
}

//MARK: - Delegate
extension ExperimenteCoordinator: ExperimenteCoordinatorDelegate {
    
}
