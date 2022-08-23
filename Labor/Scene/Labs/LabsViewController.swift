//
//  LabsViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//


import UIKit

class LabsViewController: UIViewController {
    
    var coordinator: LabsCoordinator?
    let baseView = LabsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        actionForSelectedCell()
        layout()
    }
    
    private func navigtionBarConfigure() {
        title = "Labs"
        self.navigationController?.navigationBar.tintColor = AppTheme.navigationItem.red_color

    }
    
    private func actionForSelectedCell() {
        baseView.selectedCell = {
            self.coordinator?.toCalendar()
        }
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
