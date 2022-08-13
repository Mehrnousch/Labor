//
//  LabBookCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 13.08.22.
//


import UIKit

protocol LabBookCoordinatorDelegate {
    func toAddDescription()
}

class LabBookCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = LabBookViewController()
//    private var AddDescriptionCoordinator: AddDescriptionCoordinator!

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
    func toAddDescription() {
//        AddDescriptionCoordinator = AddDescriptionCoordinator(with: navigationController)
//        AddDescriptionCoordinator?.start()
        
       
    }
}
