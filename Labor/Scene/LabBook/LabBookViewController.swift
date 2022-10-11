//
//  LabBookViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import UIKit
import Toast

class LabBookViewController: UIViewController {
    
    var coordinator: LabBookCoordinator?
    private lazy var viewModel: LabBookViewModel = {
        let vm = LabBookViewModel()
        vm.delegate = self
        return vm
    }()
    let baseView = LabBookView()
    private let loadingVC = LoadingViewController()
    private var pullToRefresh = UIRefreshControl()
    
    var reservationId: Int?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //MARK: - Get Notification SaveResult
        NotificationCenter.default.addObserver(self, selector: #selector(allertForSaveResult), name: NSNotification.Name ("SaveResult"), object: nil)
    }
    
    @objc func allertForSaveResult() {
        self.baseView.experiments = []
        if let reservationId = reservationId {
            if reservationId != 0 {
                viewModel.experimentList(reservationId: reservationId)
            }
        }
        self.baseView.detailesTableView.reloadData()
        
        let toast = Toast.default(
            image: UIImage(named: "success")!,
            title: "Experiment result",
            subtitle: "Save result successfully."
        )
        toast.show()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        if let reservationId = reservationId {
            if reservationId != 0 {
                viewModel.experimentList(reservationId: reservationId)
                self.baseView.reservationId = reservationId
            }
        }
        
        presentLoadingVC()
        actionCell()
        deleteCell()
        layout()
        
        pullToRefresh.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
    }
    
    func navigtionBarConfigure() {
        title = "Lab Book"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(rightHandAction))
    }
    
    @objc func rightHandAction() {
        if let reservationId = reservationId {
            if reservationId != 0 {
                self.coordinator?.toAddExperiment(reservationId: reservationId)
            }
        }
    }
    
    func actionCell() {
        self.baseView.selectedCell = { experimentId in
            if let reservationId = self.reservationId {
                if reservationId != 0 {
                    self.coordinator?.toShowExperiment(reservationId: reservationId, experimentId: experimentId)
                }
            }
        }
    }
    
    func deleteCell() {
        self.baseView.deleteCell = { reservedId, experimentId in
            self.viewModel.deleteReservedExperiment(reservedId: reservedId, experimentId: experimentId)
        }
    }
    
    @objc func refresh(_ sender: AnyObject) {
        self.pullToRefresh.beginRefreshing()
        self.baseView.experiments = []
        if let reservationId = reservationId {
            if reservationId != 0 {
                viewModel.experimentList(reservationId: reservationId)
            }
        }
        self.baseView.detailesTableView.reloadData()
    }
    
    func layout() {
        view.addSubview(baseView)
        baseView.detailesTableView.addSubview(pullToRefresh)
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
        self.pullToRefresh.endRefreshing()
    }
    
    func gettingReservedListFailed() {
        self.loadingVC.dismiss(animated: true, completion: nil)
        self.pullToRefresh.endRefreshing()
    }
    
    
    func deleteExperimentDescriptionSuccessful() {
        self.pullToRefresh.beginRefreshing()
        self.baseView.experiments = []
        if let reservationId = reservationId {
            if reservationId != 0 {
                viewModel.experimentList(reservationId: reservationId)
            }
        }
        self.baseView.detailesTableView.reloadData()
    }
    
    func deleteExperimentDescriptionFailed() {
        let toast = Toast.default(
            image: UIImage(named: "error")!,
            title: "Reservation Delete",
            subtitle: "Your reservation was not deleted"
        )
        toast.show()
    }
}
