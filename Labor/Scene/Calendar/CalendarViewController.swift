//
//  CalendarViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//


import UIKit

class CalendarViewController: UIViewController {
    
    var coordinator: CalendarCoordinator?
    let baseView = CalendarView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        layout()
    }
    
    func navigtionBarConfigure() {
        title = "Calendar"
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
