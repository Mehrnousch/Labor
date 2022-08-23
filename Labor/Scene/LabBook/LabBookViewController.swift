//
//  LabBookViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 23.08.22.
//

import UIKit

class LabBookViewController: UIViewController {
    
    var coordinator: LabBookCoordinator?
    let baseView = LabBookView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        actionCell()
        layout()
    }
    
    func navigtionBarConfigure() {
        title = "Digitales Laborbuch"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(rightHandAction))
        navigationItem.rightBarButtonItem?.tintColor = AppTheme.navigationItem.red_color
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Experimente",
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(leftHandAction))
        navigationItem.leftBarButtonItem?.tintColor = AppTheme.navigationItem.red_color
    }
    @objc func leftHandAction() {
        print("left bar button action")
    }
    
    
    @objc func rightHandAction() {
        self.coordinator?.toTestExperience()
    }
    
    func actionCell() {
        self.baseView.selectedCell = {

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
