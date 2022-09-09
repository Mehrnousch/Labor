//
//  CalendarCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//
import UIKit

protocol CalendarCoordinatorDelegate {
    func toFinalReserved(laborId: Int)
}

class CalendarCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = CalendarViewController()
    private var finalReserveCoordinator: FinalReserveCoordinator!

    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(laborId: Int) {
        VC.coordinator = self
        VC.laborId = laborId
        navigate(to: VC, with: .push)
    }
}

//MARK: - Delegate
extension CalendarCoordinator: CalendarCoordinatorDelegate {
    func toFinalReserved(laborId: Int) {
        finalReserveCoordinator = FinalReserveCoordinator(with: navigationController)
        finalReserveCoordinator?.start(laborId: laborId)
    }
}
