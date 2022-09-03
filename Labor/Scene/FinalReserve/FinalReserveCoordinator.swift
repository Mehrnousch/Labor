//
//  ReservationConfirmationCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 01.09.22.
//

import UIKit

protocol FinalReserveCoordinatorDelegate {
    func toReservedExperiment()
}

class FinalReserveCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = FinalReserveViewController()
    private var reservedExperimentCoordinator: ReservedExperimentCoordinator!
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        VC.coordinator = self
        navigate(to: VC, with: .push)
    }
}

//MARK: - Delegate
extension FinalReserveCoordinator: FinalReserveCoordinatorDelegate {
    func toReservedExperiment() {
        reservedExperimentCoordinator = ReservedExperimentCoordinator(with: navigationController)
        reservedExperimentCoordinator?.start()
    }
}





