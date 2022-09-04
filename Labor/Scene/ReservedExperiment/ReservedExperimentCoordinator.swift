//
//  ExperimenteCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//


import UIKit

protocol ReservedExperimentCoordinatorDelegate {
    func toLabs()
    func toLabBook(reservationId: String, experimentId: String)
}

class ReservedExperimentCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = ReservedExperimentViewController()
    private var labsCoordinator: LabsCoordinator!
    private var labBookCoordinator: LabBookCoordinator!
    
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
    
    func toLabs() {
        labsCoordinator = LabsCoordinator(with: navigationController)
        labsCoordinator?.start()
    }
    
    func toLabBook(reservationId: String, experimentId: String) {
        labBookCoordinator = LabBookCoordinator(with: navigationController)
        labBookCoordinator?.start(reservationId: reservationId, experimentId: experimentId)
    }
}
