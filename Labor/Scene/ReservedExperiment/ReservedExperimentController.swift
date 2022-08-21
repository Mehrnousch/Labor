//
//  ExperimenteViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//


import UIKit

class ReservedExperimentViewController: UIViewController {
    
    var coordinator: ReservedExperimentCoordinator?
    let baseView = ReservedExperimentView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        actionButtons()
        layout()
    }
    
    func navigtionBarConfigure() {
        title = "Experimente"


        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(rightHandAction))
        navigationItem.rightBarButtonItem?.tintColor = AppTheme.navigationItem.red_color
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Abmelden",
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(leftHandAction))
        navigationItem.leftBarButtonItem?.tintColor = AppTheme.navigationItem.red_color

    }
    
    @objc func rightHandAction() {
        self.coordinator?.toLabs()
    }

    @objc func leftHandAction() {
        print("left bar button action")
    }
    
    func actionButtons() {
        
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
