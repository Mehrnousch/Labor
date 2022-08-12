//
//  ExperimenteCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//


import UIKit

protocol ReservedExperimentCoordinatorDelegate {
}

class ReservedExperimentCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = ReservedExperimentViewController()

    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        VC.coordinator = self
        navigate(to: VC, with: .push)
    }
}

//MARK: - Delegate
extension ReservedExperimentCoordinator: ReservedExperimentCoordinatorDelegate {
    
}
