//
//  TestExperimentViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 23.08.22.
//

import UIKit

class TestExperienceViewController: UIViewController {
    
    var coordinator: TestExperienceCoordinator?
    let baseView = TestExperienceView()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

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
