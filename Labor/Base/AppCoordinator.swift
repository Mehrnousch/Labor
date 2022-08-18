//
//  AppCoordinatot.swift
//  Labor
//
//  Created by mehrnoush abdinian on 04.08.22.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    private var window: UIWindow
    
    private var loginCoordinator: LoginCoordinator?

    init(in window: UIWindow) {
        self.navigationController = UINavigationController()
    
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
        
        start()
    }
    
    func start() {
        loginCoordinator = LoginCoordinator(with: navigationController)
        loginCoordinator?.start()
    }
}
