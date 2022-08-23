//
//  LabBooksViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 23.08.22.
//

import UIKit

class LabBooksViewController: UIViewController {
    
    var coordinator: LabBooksCoordinator?
    let baseView = LabBooksView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        actionCell()
        layout()
    }
    
    func navigtionBarConfigure() {
        title = "LabBooks "
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(rightHandAction))
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
