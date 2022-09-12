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
    private let loadingVC = LoadingViewController()
    var reservationId: Int?
    var experimentId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        presentLoadingVC()

        if let reservationId = reservationId, let experimentId = experimentId {
            if reservationId != 0, experimentId != 0 {
                
                print("!!@@ reservationId \(reservationId)")
                print("!!@@ experimentId \(experimentId)")

                viewModel.showExperiment(reservationId: reservationId, experimentId: experimentId)
            }
        }
        layout()
    }
    
    func navigtionBarConfigure() {
        title = "Experiment"
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
    
    private func presentLoadingVC() {
        loadingVC.modalTransitionStyle = .crossDissolve
        loadingVC.modalPresentationStyle = .overFullScreen
        present(loadingVC, animated: false, completion: nil)
    }
}


//MARK: - ViewModelDelegate
extension ShowExperimentViewController: ShowExperimentViewModelDelegate {
    func showExperimentSuccessful(result: DetailsEexperimentModel) {
        self.baseView.setData(result: result)
        self.loadingVC.dismiss(animated: true, completion: nil)
    }
    
    func showExperimentFailed() {
        self.loadingVC.dismiss(animated: true, completion: nil)
    }
}
