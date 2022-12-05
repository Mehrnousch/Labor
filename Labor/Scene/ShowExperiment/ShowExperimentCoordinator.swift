//
//  ShowExperimentCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 04.09.22.
//

import UIKit

class ShowExperimentCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = ShowExperimentViewController()
    private var addDescriptionCoordinator: AddDescriptionCoordinator!
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(reservationId: Int, experimentId: Int) {
        VC.coordinator = self
        VC.reservationId = reservationId
        VC.experimentId = experimentId
        navigate(to: VC, with: .push)
    }
}
