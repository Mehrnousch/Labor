//
//  LabsCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//


import UIKit

protocol LabsCoordinatorDelegate {
    
}

class LabsCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = LabsViewController()
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        VC.coordinator = self
        navigate(to: VC, with: .push)
    }
}

//MARK: - Delegate
extension LabsCoordinator: LabsCoordinatorDelegate {

}
