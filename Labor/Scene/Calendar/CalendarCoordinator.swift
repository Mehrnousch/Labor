//
//  CalendarCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//
import UIKit

protocol CalendarCoordinatorDelegate {
    func toReservationConfirmation()
}

class CalendarCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = CalendarViewController()
    private var finalReserveCoordinator: FinalReserveCoordinator!

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
    func toReservationConfirmation() {
        finalReserveCoordinator = FinalReserveCoordinator(with: navigationController)
        finalReserveCoordinator?.start()
    }
}
