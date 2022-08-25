//
//  AddDescriptionViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 13.08.22.
//


import UIKit

class DescriptionViewController: UIViewController {
    
    var coordinator: DescriptionCoordinator?
    let baseView = DescriptionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        layout()
    }
    
    func navigtionBarConfigure() {
        title = "Experiment Beschreibung"
        

    }
    
    private func layout() {
        view.addSubview(baseView)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: baseView.topAnchor),
            view.bottomAnchor.constraint(equalTo: baseView.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: baseView.trailingAnchor),
            view.leadingAnchor.constraint(equalTo: baseView.leadingAnchor),
        ])
    }
}
