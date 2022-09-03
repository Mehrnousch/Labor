//
//  ReservationConfirmationViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 01.09.22.
//

import UIKit

class FinalReserveViewController: UIViewController {
    
    var coordinator: FinalReserveCoordinator?
    let baseView = FinalReserveView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        actionButtons()
        layout()
    }
    
    func navigtionBarConfigure() {
        title = "Final reserve"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    
    
    
    
    
    
    func actionButtons() {
        baseView.agreeRulesButton.addAction { [weak self] in
            guard let self = self else { return }
            self.baseView.agreeRulesButton.setIconSelectButton()
        }
        
        baseView.existenceManagerButton.addAction { [weak self] in
            guard let self = self else { return }
            self.baseView.existenceManagerButton.setIconSelectButton()
        }
            }
    
    func layout() {
        view.addSubview(baseView)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: baseView.topAnchor),
            view.bottomAnchor.constraint(equalTo: baseView.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: baseView.trailingAnchor),
            view.leadingAnchor.constraint(equalTo: baseView.leadingAnchor),
        ])
    }
}
