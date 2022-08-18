//
//  LabBookViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 13.08.22.
//


import UIKit
import CoreTelephony
class LabBookViewController: UIViewController {
    
    var coordinator: LabBookCoordinator?
    let baseView = LabBookView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        actionButtons()
        layout()
        
        let networkInfo = CTTelephonyNetworkInfo()
        if #available(iOS 12.0, *) {
            let carrier = networkInfo.serviceSubscriberCellularProviders?.first?.value.mobileCountryCode
            print("1-country code is = \(carrier)")
            if carrier == "262" {
                print("made in germani")
            }
            
        } else {
            let carrier = networkInfo.subscriberCellularProvider?.mobileCountryCode
            print("2-country code is = \(carrier)")
            if carrier == "262" {
                print("made in germani")
            }
        }
    }
    
    func navigtionBarConfigure() {
        title = "Digitales Laborbuch"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(rightHandAction))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Experimente",
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(leftHandAction))
    }
    
    @objc func rightHandAction() {
//        self.coordinator?.toAddDescription()
        print("right bar button action")

    }

    @objc func leftHandAction() {
        print("left bar button action")
    }
    
    func actionButtons() {
        
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
