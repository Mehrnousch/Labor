//
//  AddDescriptionViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import UIKit
import Toast

class AddDescriptionViewController: UIViewController {
    
    var coordinator: AddDescriptionCoordinator?
    private lazy var viewModel: AddDescriptionViewModel = {
        let vm = AddDescriptionViewModel()
        vm.delegate = self
        return vm
    }()
    let baseView = AddDescriptionView()
    var chosenLeftPhotoPlace = false
    var chosenRightPhotoPlace = false
    
    var labName: String?
    var reservationId: Int?
    var firstImageStr: String?
    var secondImageStr: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        actionButtons()
        setupPhoto()
        layout()
    }
    
    func navigtionBarConfigure() {
        title = "Add description"
    }
    
    func actionButtons() {
        baseView.descriptionButton.addAction { [weak self] in
            guard let self = self else { return }
            self.coordinator?.toTextPage()
        }
        
        baseView.rightPhotoButton.addAction { [weak self] in
            guard let self = self else { return }
            self.chosenRightPhotoPlace = true
            self.chosenLeftPhotoPlace = false
            self.allertHandler()
        }
        
        baseView.leftPhotoButton.addAction { [weak self] in
            guard let self = self else { return }
            self.chosenRightPhotoPlace = false
            self.chosenLeftPhotoPlace = true
            self.allertHandler()
        }
        
        baseView.saveButton.addAction { [weak self] in
            guard let self = self else { return }
            
            print("!!@! labName \(self.labName)")
            print("!!@! reservationId \(self.reservationId)")
            print("!!@! firstImageStr \(self.firstImageStr)")
            print("!!@! secondImageStr \(self.secondImageStr)")
            print("!!@! description \(UserDefaultsStorage.shared.descriptionExperiment)")

            
            if let reservationId = self.reservationId, let labName = self.labName, let description = UserDefaultsStorage.shared.descriptionExperiment, let firstImage = self.firstImageStr, let secondImage = self.secondImageStr {
                if reservationId > 0, labName != "", description != "", firstImage != "", secondImage != "" {
                    self.viewModel.addDescription(reservationId: reservationId, name: labName, description: description, firstPhoto: firstImage, secondPhoto: secondImage)
                } else {
                    Toast.text("Fill in all the items.").show()
                }
            }
        }
    }
    
    func allertHandler() {
        // create the alert
        let alert = UIAlertController(title: "Post photo", message: "Choose one of the following.", preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Camera", style: UIAlertAction.Style.default, handler: { _ in
            guard let topVC = self.navigationController?.topViewController else { return }
            PhotoHandler.shared.camera(vc: topVC)
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: UIAlertAction.Style.default, handler: { _ in
            guard let topVC = self.navigationController?.topViewController else { return }
            PhotoHandler.shared.photoLibrary(vc: topVC)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive, handler: { _ in
            self.dismiss(animated: true)
        }))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func setupPhoto() {
        
        PhotoHandler.shared.imagePickedBlock = { (image) in
            if self.chosenLeftPhotoPlace {
                self.baseView.leftPhotoButton.setImage(image, for: .normal)
//                if let jpegImage = image.jpegData(compressionQuality: 1.0) {
//                    let strImage: String = jpegImage.base64EncodedString()
//                    self.firstImageStr = strImage
//                    print("strImage = \(strImage)")
//                }
                
                let jpegImage = image.jpegData(compressionQuality: 1.0)
                let strBase64 = jpegImage?.base64EncodedString(options: .lineLength64Characters)
                print("strImage = \(strBase64)")
            } else {
                self.baseView.rightPhotoButton.setImage(image, for: .normal)
                if let jpegImage = image.jpegData(compressionQuality: 1.0) {
                    let strImage: String = jpegImage.base64EncodedString()
                    self.secondImageStr = strImage
                }
            }
        }
        
        PhotoHandler.shared.alertCmeraAccessNeeded = { [weak self] in
            guard let self = self else { return }
            let settingsAppURL = URL(string: UIApplication.openSettingsURLString)!
            
            let alert = UIAlertController(
                title: "Need camera access",
                message: "Camera access details",
                preferredStyle: .alert
            )
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Allow camera", style: .cancel, handler: { (alert) -> Void in
                UIApplication.shared.open(settingsAppURL, options: [:], completionHandler: nil)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        
        PhotoHandler.shared.alertGalleryAccessNeeded = { [weak self] in
            guard let self = self else { return }
            let settingsAppURL = URL(string: UIApplication.openSettingsURLString)!
            
            let alert = UIAlertController(
                title: "Need gallery access",
                message: "Gallery access details",
                preferredStyle: .alert
            )
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Allow gallery", style: .cancel, handler: { (alert) -> Void in
                UIApplication.shared.open(settingsAppURL, options: [:], completionHandler: nil)
            }))
            
            self.present(alert, animated: true, completion: nil)
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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UserDefaultsStorage.shared.descriptionExperiment = ""
    }
}


extension AddDescriptionViewController: AddDescriptionViewModelDelegate  {
    func reserveSuccess() {
        
    }
    
    func reserveFailed(error: String) {
        
    }
}
