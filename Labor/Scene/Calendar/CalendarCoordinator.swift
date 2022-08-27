//
//  CalendarCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//
import UIKit

protocol CalendarCoordinatorDelegate {
    func toReservedExperiment()
}

class CalendarCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = CalendarViewController()
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
extension CalendarCoordinator: CalendarCoordinatorDelegate {
    func toReservedExperiment() {
        reservedExperimentCoordinator = ReservedExperimentCoordinator(with: navigationController)
        reservedExperimentCoordinator?.start()
    }
}
