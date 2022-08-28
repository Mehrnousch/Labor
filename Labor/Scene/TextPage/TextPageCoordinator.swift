//
//  TextPageCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import UIKit

protocol TextPageCoordinatorDelegate {
    
}

class TextPageCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let VC = TextPageViewContoller()
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        VC.coordinator = self
        navigate(to: VC, with: .present)
    }
}

//MARK: - Delegate
extension TextPageCoordinator: TextPageCoordinatorDelegate {

}
