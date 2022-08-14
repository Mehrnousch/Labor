//
//  AddDescriptionCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 13.08.22.
//

import UIKit

protocol DescriptionCoordinatorDelegate {
    
}

class DescriptionCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = DescriptionViewController()
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        VC.coordinator = self
        navigate(to: VC, with: .push)
    }
}

//MARK: - Delegate
extension DescriptionCoordinator: DescriptionCoordinatorDelegate {

}
