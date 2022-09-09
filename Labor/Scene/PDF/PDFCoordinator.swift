//
//  PDFCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 08.09.22.
//

import UIKit

protocol PDFCoordinatorDelegate {

}

class PDFCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = PDFViewController()

    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(pdfName: String) {
        VC.coordinator = self
        VC.pdfName = pdfName
        navigate(to: VC, with: .push)
    }
}

//MARK: - Delegate
extension PDFCoordinator: PDFCoordinatorDelegate {
    
}
