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
    
    var allReservations = [Int]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UserDefaultsStorage.shared.startExperiment = 0.0
        UserDefaultsStorage.shared.endExperiment = 0.0
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
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Weiter",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(rightHandAction))
    }
    
    @objc func rightHandAction() {
        let startTimeExpirment = UserDefaultsStorage.shared.startExperiment
        
        if allReservations.contains(Int(startTimeExpirment)) {
            let toast = Toast.default(
                image: UIImage(named: "error")!,
                title: "Time reservation",
                subtitle: "Die gewünschte Zeit ist bereits reserviert."
            )
            toast.show()
        } else if startTimeExpirment > 0 {
            let currentTimestamp = NSDate().timeIntervalSince1970
            if startTimeExpirment > currentTimestamp {
                self.coordinator?.toFinalReserved(laborId: laborId)
            } else {
                let toast = Toast.default(
                    image: UIImage(named: "error")!,
                    title: "Time reservation",
                    subtitle: "Die gewählte Termin ist abgelaufen"
                )
                toast.show()
            }
        } else {
            let toast = Toast.default(
                image: UIImage(named: "error")!,
                title: "Zeitreservierung",
                subtitle: "Sie haben keine Zeit für das Experiment angegeben"
            )
            toast.show()
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
    func gettingReservedTimeSuccessful(reservations: [ReservedModel]) {
        for item in 0 ..< reservations.count {
            allReservations.append(Int(reservations[item].startDate_Time))
            
        }
        self.baseView.setData(timeList: ["8", "9", "10", "11", "12", "13", "14", "15"])
        self.baseView.allReservations=allReservations
    }
    
    func gettingReservedTimeFailed() {
        print("Getting reserved time failed")
    }
}
