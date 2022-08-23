//
//  LabBooksCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 23.08.22.
//

import UIKit

protocol LabBooksCoordinatorDelegate {
    func toTestExperience()
}

class LabBooksCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = LabBooksViewController()
    private var testExperienceCoordinator: TestExperienceCoordinator!
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        VC.coordinator = self
        navigate(to: VC, with: .push)
    }
}

//MARK: - Delegate
extension LabBooksCoordinator: LabBooksCoordinatorDelegate {
    func toTestExperience() {
        testExperienceCoordinator = TestExperienceCoordinator(with: navigationController)
        testExperienceCoordinator?.start()
    }
}
