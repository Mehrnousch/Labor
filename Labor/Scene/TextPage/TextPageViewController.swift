//
//  TextPageViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import UIKit
import Toast

class TextPageViewContoller: UIViewController {
    
    var coordinator: TextPageCoordinator?
    let baseView = TextPageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        actionButtons()
        layout()
    }
    
    func actionButtons() {
        self.baseView.saveButton.addAction { [weak self] in
            guard let self = self else { return }
            if let description = self.baseView.textBox.text {
                if description != "" {
                    UserDefaultsStorage.shared.descriptionExperiment = description
                    self.dismiss(animated: true)
                } else {
                    Toast.text("Bitte geben Sie die Beschreibung ein").show()
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
}
