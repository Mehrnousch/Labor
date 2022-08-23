//
//  DetailesCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 23.08.22.
//

import UIKit

protocol DetailesCoordinatorDelegate {
    func toTestExperience()
}

class DetailesCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = DetailesViewController()
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
extension DetailesCoordinator: DetailesCoordinatorDelegate {
    func toTestExperience() {
        testExperienceCoordinator = TestExperienceCoordinator(with: navigationController)
        testExperienceCoordinator?.start()
    }
}
