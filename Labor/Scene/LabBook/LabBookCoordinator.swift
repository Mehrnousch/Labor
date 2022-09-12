//
//  LabBookCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import UIKit

protocol LabBookCoordinatorDelegate {
    func toAddExperiment(reservationId: Int, labName: String)
    func toShowExperiment(reservationId: Int, experimentId: Int)
}

class LabBookCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = LabBookViewController()
    private var addDescriptionCoordinator: AddDescriptionCoordinator!
    private var showExperimentCoordinator: ShowExperimentCoordinator!

    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(reservationId: Int, labName: String) {
        VC.coordinator = self
        VC.reservationId = reservationId
        VC.labName = labName
        navigate(to: VC, with: .push)
    }
}

//MARK: - Delegate
extension LabBookCoordinator: LabBookCoordinatorDelegate {
    func toAddExperiment(reservationId: Int, labName: String) {
        addDescriptionCoordinator = AddDescriptionCoordinator(with: navigationController)
        addDescriptionCoordinator?.start(reservationId: reservationId, labName: labName)
    }
    
    func toShowExperiment(reservationId: Int, experimentId: Int) {
        showExperimentCoordinator = ShowExperimentCoordinator(with: navigationController)
        showExperimentCoordinator?.start(reservationId: reservationId, experimentId: experimentId)
    }
}
