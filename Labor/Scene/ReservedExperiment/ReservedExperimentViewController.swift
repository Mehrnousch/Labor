//
//  ExperimenteViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//


import UIKit
import Toast

class ReservedExperimentViewController: UIViewController {
    
    var coordinator: ReservedExperimentCoordinator?
    private lazy var viewModel: ReservedExperimentViewModel = {
        let vm = ReservedExperimentViewModel()
        vm.delegate = self
        return vm
    }()
    let baseView = ReservedExperimentView()
    private let loadingVC = LoadingViewController()
    private var pullToRefresh = UIRefreshControl()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //MARK: - Get Notification RegisterSuccessful
        NotificationCenter.default.addObserver(self, selector: #selector(reserveSuccessful), name: NSNotification.Name ("ReserveSuccessful"), object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        actionCell()
        deleteCell()
        layout()
        
        //MARK: - Get date for Calendar
        CalendarInformation.shared.formaterCalendar()

        presentLoadingVC()
        viewModel.getReservedList()
                
        pullToRefresh.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
    }
    
    @objc func reserveSuccessful() {
        let toast = Toast.default(
            image: UIImage(named: "success")!,
            title: "Reservation",
            subtitle: "The reservation was successfully registered."
        )
        toast.show()
        
        self.baseView.reservations = []
        self.viewModel.getReservedList()
        self.baseView.experimenteTableView.reloadData()
    }
    
    func navigtionBarConfigure() {
        title = "Experimente"
        self.navigationController?.navigationBar.tintColor = AppTheme.navigationItem.red_color
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(rightHandAction))
        //        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "LogOut",
        //                                                                style: .plain,
        //                                                                target: self,
        //                                                                action: #selector(leftHandAction))
      
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Abmelden",
                                                                        style: .plain,
                                                                        target: self,
                                                                        action: #selector(leftHandAction))
        
        
    }
    
    @objc func rightHandAction() {
        self.coordinator?.toLabs()
    }

    @objc func leftHandAction() {
        self.viewModel.logout()
        
    }
    
    func actionCell() {
        self.baseView.selectedCell = { reservationId in
            self.coordinator?.toLabBook(reservationId: reservationId)
        }
    }
    
    func deleteCell() {
        self.baseView.deleteCell = { reservedId in
            self.viewModel.deleteReservedExperiment(reservedId: reservedId)
        }
    }
    
    @objc func refresh(_ sender: AnyObject) {
        self.pullToRefresh.beginRefreshing()
        self.baseView.reservations = []
        self.viewModel.getReservedList()
        self.baseView.experimenteTableView.reloadData()
    }
    
    func layout() {
        view.addSubview(baseView)
        baseView.experimenteTableView.addSubview(pullToRefresh)
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
extension ReservedExperimentViewController: ReservedExperimentViewModelDelegate {
   
    func gettingReservedListSuccessful(reservations: [ReservedModel]) {
        self.baseView.setData(reservations: reservations)
        self.loadingVC.dismiss(animated: true, completion: nil)
        self.pullToRefresh.endRefreshing()
    }
    
    func gettingReservedListFailed(error: String) {
        self.loadingVC.dismiss(animated: true, completion: nil)
        self.pullToRefresh.endRefreshing()
        
        let toast = Toast.default(
            image: UIImage(named: "error")!,
            title: "Reservations",
            subtitle: error
        )
        toast.show()
    }
    
    func deleteReservedExperimentSuccessful() {
        self.baseView.reservations = []
        self.viewModel.getReservedList()
        self.baseView.experimenteTableView.reloadData()
    }
    
    func deleteReservedExperimentFailed() {
        let toast = Toast.default(
            image: UIImage(named: "error")!,
            title: "Reservation Delete",
            subtitle: "Your reservation was not deleted"
        )
        toast.show()
    }
    func logoutSuccessful() {
            if let VC = self.navigationController?.viewControllers.filter({$0.isKind(of: LoginViewController.self)}).first {
                self.navigationController?.popToViewController(VC, animated: true)
            } else {
                self.coordinator?.toLogin()
            }
            KeyChainStorage.delete()
        }
        
        func logoutFailed(error: String) {
            print(error)
        }
}
