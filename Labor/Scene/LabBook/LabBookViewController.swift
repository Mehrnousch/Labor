//
//  LabBookViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import UIKit

class LabBookViewController: UIViewController {
    
    var coordinator: LabBookCoordinator?
    private lazy var viewModel: LabBookViewModel = {
        let vm = LabBookViewModel()
        vm.delegate = self
        return vm
    }()
    let baseView = LabBookView()
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
        actionCell()
        layout()
    }
    
    func navigtionBarConfigure() {
        title = "Lab Book"
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


//MARK: - ViewModelDelegate
extension LabBookViewController: LabBookViewModelDelegate {
    func gettingReservedListSuccessful() {
        
    }
    
    func gettingReservedListFailed() {
        
    }
}
