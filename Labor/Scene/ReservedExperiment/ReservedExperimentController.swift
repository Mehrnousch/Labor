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
        title = "Tests gemacht"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(rightHandAction))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "LogOut",
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(leftHandAction))
    }
    
    @objc func rightHandAction() {
        print("right bar button action")
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