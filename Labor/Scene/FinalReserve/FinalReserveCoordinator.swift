//
//  ReservationConfirmationCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 01.09.22.
//

import UIKit

protocol FinalReserveCoordinatorDelegate {
    func toPDF(pdfName: String)
}

class FinalReserveCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = FinalReserveViewController()
    private var pdfCoordinator: PDFCoordinator!
    
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
extension FinalReserveCoordinator: FinalReserveCoordinatorDelegate {
    func toPDF(pdfName: String) {
        pdfCoordinator = PDFCoordinator(with: navigationController)
        pdfCoordinator?.start(pdfName: pdfName)
    }
}
