//
//  CalendarViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//

import UIKit
import Toast

class CalendarViewController: UIViewController {
    
    var coordinator: CalendarCoordinator?
    private lazy var viewModel: CalendarViewModel = {
        let vm = CalendarViewModel()
        vm.delegate = self
        return vm
    }()
    let baseView = CalendarView()
    var laborId = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UserDefaultsStorage.shared.startExperiment = "0"
        UserDefaultsStorage.shared.endExperiment = "0"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        layout()
        if laborId > 0 {
            viewModel.getReservedList(laborId: laborId)
        }
    }
    
    func navigtionBarConfigure() {
        title = "Calendar"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Continue",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(rightHandAction))
    }
    
    @objc func rightHandAction() {
        if let startTimeExpirment = Double(UserDefaultsStorage.shared.startExperiment ?? "") {
            if startTimeExpirment > 0 {
                self.coordinator?.toFinalReserved(laborId: laborId)
            } else {
                let toast = Toast.default(
                    image: UIImage(named: "error")!,
                    title: "Time reservation",
                    subtitle: "You have not specified a time for booking"
                )
                toast.show()
            }
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


//MARK: - ViewModelDelegate
extension CalendarViewController: CalendarViewModelDelegate {
    func gettingReservedTimeSuccessful() {
        
    }
    
    func gettingReservedTimeFailed() {
        
    }
}
