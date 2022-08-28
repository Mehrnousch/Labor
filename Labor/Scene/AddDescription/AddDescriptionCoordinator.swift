//
//  AddDescriptionCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import UIKit

protocol AddDescriptionCoordinatorDelegate {
    func toTextPage()
}

class AddDescriptionCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = AddDescriptionViewController()
    private var textPageCoordinator: TextPageCoordinator!
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        VC.coordinator = self
        navigate(to: VC, with: .push)
    }
}

//MARK: - Delegate
extension AddDescriptionCoordinator: AddDescriptionCoordinatorDelegate {
    func toTextPage() {
        textPageCoordinator = TextPageCoordinator(with: navigationController)
        textPageCoordinator?.start()
    }
}
