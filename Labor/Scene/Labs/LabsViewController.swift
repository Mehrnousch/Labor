//
//  LabsViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//


import UIKit

class LabsViewController: UIViewController {
    
    var coordinator: LabsCoordinator?
    private lazy var viewModel: LabsViewModel = {
        let vm = LabsViewModel()
        vm.delegate = self
        return vm
    }()
    let baseView = LabsView()
    private let loadingVC = LoadingViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        actionForSelectedCell()
        layout()
        presentLoadingVC()
        viewModel.getLabList()
    }
    
    private func navigtionBarConfigure() {
        title = "Labors"
    }
    
    private func actionForSelectedCell() {
        baseView.selectedCell = { laborId in
            self.coordinator?.toCalendar(laborId: laborId)
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
    
    private func presentLoadingVC() {
        loadingVC.modalTransitionStyle = .crossDissolve
        loadingVC.modalPresentationStyle = .overFullScreen
        present(loadingVC, animated: false, completion: nil)
    }
}


//MARK: - ViewModelDelegate
extension LabsViewController: LabsViewModelDelegate {
    func gettingLabsListSuccessful(labs: [LabModel]) {
        self.baseView.setData(labs: labs)
        self.loadingVC.dismiss(animated: true, completion: nil)
    }
    
    func gettingLabsListFailed() {
        self.loadingVC.dismiss(animated: true, completion: nil)
    }
}
