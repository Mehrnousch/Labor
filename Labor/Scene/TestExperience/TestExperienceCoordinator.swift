//
//  TestExperienceCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 23.08.22.
//

import UIKit

protocol TestExperienceCoordinatorDelegate {
    
}

class TestExperienceCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = TestExperienceViewController()
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        VC.coordinator = self
        navigate(to: VC, with: .push)
    }
}

//MARK: - Delegate
extension TestExperienceCoordinator: TestExperienceCoordinatorDelegate {

}
