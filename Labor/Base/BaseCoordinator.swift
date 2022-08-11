//
//  BaseCoordinator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 04.08.22.
//

import UIKit

enum navigationStyle {
    case present
    case push
}

protocol BaseCoordinator: AnyObject {
    var navigationController: UINavigationController { get }
}

extension BaseCoordinator {
    
    func navigate(to viewController: UIViewController, with presentationStyle: navigationStyle, animated: Bool = true) {
        switch presentationStyle {
        case .present:
            navigationController.present(viewController, animated: animated, completion: nil)
        case .push:
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    
    func start() {
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }

    func finish() {
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }
}
