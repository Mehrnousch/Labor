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
    private let loadingVC = LoadingViewController()
    var reservationId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        if let reservationId = reservationId {
            if reservationId != "" {
                viewModel.showExperiment(reservationId: Int(reservationId) ?? 0)
            }
        }
        
        presentLoadingVC()
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
    
    private func presentLoadingVC() {
        loadingVC.modalTransitionStyle = .crossDissolve
        loadingVC.modalPresentationStyle = .overFullScreen
        present(loadingVC, animated: false, completion: nil)
    }
}


//MARK: - ViewModelDelegate
extension LabBookViewController: LabBookViewModelDelegate {
    func gettingReservedListSuccessful(experiments: [ExperimentModel]) {
        self.baseView.setData(experiments: experiments)
        self.loadingVC.dismiss(animated: true, completion: nil)
    }
    
    func gettingReservedListFailed() {
        self.loadingVC.dismiss(animated: true, completion: nil)
    }
}
