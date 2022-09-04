//
//  ShowExperimentViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 04.09.22.
//

import UIKit

class ShowExperimentViewController: UIViewController {
    
    var coordinator: ShowExperimentCoordinator?
    private lazy var viewModel: ShowExperimentViewModel = {
        let vm = ShowExperimentViewModel()
        vm.delegate = self
        return vm
    }()
    let baseView = ShowExperimentView()
    var reservationId: String?
    var experimentId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        if let reservationId = reservationId, let experimentId = experimentId {
            if reservationId != "", experimentId != "" {
                
                print("!!@@ reservationId \(reservationId)")
                print("!!@@ experimentId \(experimentId)")

                viewModel.showExperiment(reservationId: Int(reservationId) ?? 0, experimentId: Int(experimentId) ?? 0)
            }
        }
        layout()
    }
    
    func navigtionBarConfigure() {
        title = "Lab Book"
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


//MARK: - ViewModelDelegate
extension ShowExperimentViewController: ShowExperimentViewModelDelegate {
    func showExperimentSuccessful() {
        
    }
    
    func showExperimentFailed() {
        
    }
}
