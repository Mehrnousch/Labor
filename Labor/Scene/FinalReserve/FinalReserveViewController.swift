//
//  ReservationConfirmationViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 01.09.22.
//

import UIKit
import WebKit
import Toast

class FinalReserveViewController: UIViewController {
    
    private let notificationCenter = NotificationCenter.default

    var coordinator: FinalReserveCoordinator?
    private lazy var viewModel: FinalReserveViewModel = {
        let vm = FinalReserveViewModel()
        vm.delegate = self
        return vm
    }()
    let baseView = FinalReserveView()
    var laborId = 0
    let webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        actionButtons()
        layout()
    }
    
    func navigtionBarConfigure() {
        title = "Final reserve"
    }
    
    func actionButtons() {
        baseView.protocolPdfButton.addAction { [weak self] in
            guard let self = self else { return }
            self.coordinator?.toPDF(pdfName: AppTheme.pdfName.protocolPdf)
        }

        baseView.securityPdfButton.addAction { [weak self] in
            guard let self = self else { return }
            self.coordinator?.toPDF(pdfName: AppTheme.pdfName.securityPdf)
        }

        baseView.cleanPdfButton.addAction { [weak self] in
            guard let self = self else { return }
            self.coordinator?.toPDF(pdfName: AppTheme.pdfName.cleanPdf)
        }

        baseView.agreeRulesButton.addAction { [weak self] in
            guard let self = self else { return }
            self.baseView.agreeRulesButton.setIconSelectButton()
        }
        
        baseView.existenceManagerButton.addAction { [weak self] in
            guard let self = self else { return }
            self.baseView.existenceManagerButton.setIconSelectButton()
        }
        
        baseView.saveButton.addAction { [weak self] in
            guard let self = self else { return }
            let agreeRules = self.baseView.agreeRulesButton.isItClicked
            let existenceManager = self.baseView.existenceManagerButton.isItClicked
            var agreeRulesValue = 0
            var existenceManagerValue = 0

            if agreeRules {
                agreeRulesValue = 1
            } else {
                agreeRulesValue = 0
            }
            
            if existenceManager {
                existenceManagerValue = 1
            } else {
                existenceManagerValue = 0
            }
            
            if let title = self.baseView.experimentTitleTextField.text,
               let description = self.baseView.experimentInfoTextView.text {
                
                let startAt = UserDefaultsStorage.shared.startExperiment
                let endAt = UserDefaultsStorage.shared.endExperiment
                if startAt != 0.0,
                   endAt != 0.0,
                   title != "",
                   description != "",
                   agreeRulesValue > 0,
                   self.laborId > 0
                {
                    self.viewModel.finalReserve(laborId: self.laborId, startAt: startAt, endAt: endAt, supervisorNeeded: existenceManagerValue, title: title, description: description)
                } else {
                    Toast.text("Fill in all the items and check the desired options").show()
                }
            }
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
    
    //MARK: - Remove Notification ReserveSuccessful
    deinit {
        notificationCenter.removeObserver(self, name: NSNotification.Name("ReserveSuccessful"), object: nil)
    }
}


//MARK: - ViewModelDelegate
extension FinalReserveViewController: FinalReserveViewModelDelegate {
    func reserveSuccess() {
        self.navigationController?.popToRootViewController(animated: true)
        
        //MARK: - Post Notification ReserveSuccessful
        notificationCenter.post(name: NSNotification.Name("ReserveSuccessful"), object: nil, userInfo: nil)
    }
    
    func reserveFailed(error: String) {
        let toast = Toast.default(
            image: UIImage(named: "error")!,
            title: "Error",
            subtitle: error
        )
        toast.show()
    }
}
