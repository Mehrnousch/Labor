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
    private var reservedExperimentCoordinator: AddDescriptionCoordinator?

    init(in window: UIWindow) {
        self.navigationController = UINavigationController()
    
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
                
        let secondLaunch = UserDefaults.standard.bool(forKey: "First Launch")
        print("KeyChainStorage = \(KeyChainStorage.getToken()) launch = \(secondLaunch)")

        if secondLaunch, KeyChainStorage.getToken() == ""  {
            newCustomer()
        } else if secondLaunch, KeyChainStorage.getToken() != ""  {
            print("Second Launch.")
            oldCustomer()
        } else if !secondLaunch, KeyChainStorage.getToken() == "" {
            print("First Launch.")
            UserDefaults.standard.set(true, forKey: "First Launch")
            newCustomer()
        } else if !secondLaunch, KeyChainStorage.getToken() != "" {
            KeyChainManager.delete()
            print("First Launch.")
            UserDefaults.standard.set(true, forKey: "First Launch")
            newCustomer()
        }
    }
    
    func newCustomer() {
        loginCoordinator = LoginCoordinator(with: navigationController)
        loginCoordinator?.start()
    }
    
    func oldCustomer() {
        reservedExperimentCoordinator = AddDescriptionCoordinator(with: navigationController)
        reservedExperimentCoordinator?.start()
    }
}
