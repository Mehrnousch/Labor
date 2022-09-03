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

    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        actionCell()
        layout()
        
        print("token = \(KeyChainStorage.getToken())")
        viewModel.getReservedList()
        
        NotificationCenter.default.addObserver(self, selector: #selector(NotFirst), name: NSNotification.Name ("NotFirstLaunch"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(FirstLaunch), name: NSNotification.Name ("FirstLaunch"), object: nil)
    }
    
    @objc func NotFirst() {
        let toast = Toast.default(
            image: UIImage(named: "success")!,
            title: "NotFirstLaunch",
            subtitle: "NotFirstLaunch"
        )
        toast.show()
    }
    
    @objc func FirstLaunch() {
        let toast = Toast.default(
            image: UIImage(named: "success")!,
            title: "FirstLaunch",
            subtitle: "FirstLaunch"
        )
        toast.show()
    }
    
    func navigtionBarConfigure() {
        title = "Tests gemacht"
        self.navigationController?.navigationBar.tintColor = AppTheme.navigationItem.red_color
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(rightHandAction))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "LogOut",
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(leftHandAction))
    }
    
    @objc func rightHandAction() {
        self.coordinator?.toLabs()
    }

    @objc func leftHandAction() {
        print("left bar button action")
    }
    
    func actionCell() {
        self.baseView.selectedCell = {
            self.coordinator?.toLabBook()
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
extension ReservedExperimentViewController: ReservedExperimentViewModelDelegate {
    func gettingReservedListSuccessful(newToken: String) {
        
    }
    
    func gettingReservedListFailed(errorMessages: [String]) {
        
    }
}
