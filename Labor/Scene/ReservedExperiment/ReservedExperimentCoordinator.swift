//
//  ExperimenteCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//


import UIKit

protocol ReservedExperimentCoordinatorDelegate {
    func toLogin()
    func toLabs()
    func toLabBook(reservationId: Int)
}

class ReservedExperimentCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = ReservedExperimentViewController()
    private var loginCoordinator: LoginCoordinator!
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
    func toLogin() {
        loginCoordinator = LoginCoordinator(with: navigationController)
        loginCoordinator?.start()
    }
    
    func toLabs() {
        labsCoordinator = LabsCoordinator(with: navigationController)
        labsCoordinator?.start()
    }
    
    func toLabBook(reservationId: Int) {
        labBookCoordinator = LabBookCoordinator(with: navigationController)
        labBookCoordinator?.start(reservationId: reservationId)
    }
}
