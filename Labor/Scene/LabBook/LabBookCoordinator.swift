//
//  LabBookCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import UIKit

protocol LabBookCoordinatorDelegate {
    func toTestExperience()
}

class LabBookCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = LabBookViewController()
    private var addDescriptionCoordinator: AddDescriptionCoordinator!
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        VC.coordinator = self
        navigate(to: VC, with: .push)
    }
}

//MARK: - Delegate
extension LabBookCoordinator: LabBookCoordinatorDelegate {
    func toTestExperience() {
        addDescriptionCoordinator = AddDescriptionCoordinator(with: navigationController)
        addDescriptionCoordinator?.start()
    }
}
