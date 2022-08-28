//
//  TextPageViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import UIKit

class TextPageViewContoller: UIViewController {
    
    var coordinator: TextPageCoordinator?
    let baseView = TextPageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        layout()
    }
    
    func navigtionBarConfigure() {
        title = "Add description"
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
