//
//  AddDescriptionViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import UIKit
import Toast

class AddDescriptionViewController: UIViewController {
    
    private let notificationCenter = NotificationCenter.default

    var coordinator: AddDescriptionCoordinator?
    private lazy var viewModel: AddDescriptionViewModel = {
        let vm = AddDescriptionViewModel()
        vm.delegate = self
        return vm
    }()
    let baseView = AddDescriptionView()
    var chosenLeftPhotoPlace = false
    var chosenRightPhotoPlace = false
    
    var reservationId: Int?
    var firstImageStr = Data()
    var secondImageStr = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        actionButtons()
        setupPhoto()
        layout()
    }
    
    func navigtionBarConfigure() {
        title = "Beschreibung des Experiments"
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
            
            print(self.reservationId ?? "")
            
            if self.reservationId ?? 0 > 0, self.baseView.nameExperimentTextField.text != "", !self.firstImageStr.isEmpty, !self.secondImageStr.isEmpty {
                self.viewModel.addDescription(reservationId: self.reservationId ?? 0, name: self.baseView.nameExperimentTextField.text ?? "", description: UserDefaultsStorage.shared.descriptionExperiment ?? "", firstPhoto: self.firstImageStr, secondPhoto: self.secondImageStr)
                self.startUploadPhotos()
            } else {
                Toast.text("Bitte geben Sie zwei Fotos und einen Titel ein.").show()
            }
        }
    }
    
    func startUploadPhotos() {
        let alert = UIAlertController(title: nil, message: "Warten Sie bitte...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    func allertHandler() {
        // create the alert
        let alert = UIAlertController(title: "Post photo", message: "Choose one of the following.", preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Kamera", style: UIAlertAction.Style.default, handler: { _ in
            guard let topVC = self.navigationController?.topViewController else { return }
            PhotoHandler.shared.camera(vc: topVC)
        }))
        
        alert.addAction(UIAlertAction(title: "Photos", style: UIAlertAction.Style.default, handler: { _ in
            guard let topVC = self.navigationController?.topViewController else { return }
            PhotoHandler.shared.photoLibrary(vc: topVC)
        }))
        
        alert.addAction(UIAlertAction(title: "Abbrechen", style: UIAlertAction.Style.destructive, handler: { _ in
            self.dismiss(animated: true)
        }))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func setupPhoto() {
        
        PhotoHandler.shared.imagePickedBlock = { (image) in
            if self.chosenLeftPhotoPlace {
                self.baseView.leftPhotoButton.setImage(image, for: .normal)
                if let jpegImage = image.jpegData(compressionQuality: 1.0) {
                    self.firstImageStr = jpegImage
                }
            } else {
                self.baseView.rightPhotoButton.setImage(image, for: .normal)
                if let jpegImage = image.jpegData(compressionQuality: 1.0) {
                    self.secondImageStr = jpegImage
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
    
    //MARK: - Remove Notification SaveResult
    deinit {
        notificationCenter.removeObserver(self, name: NSNotification.Name("SaveResult"), object: nil)
    }
}


extension AddDescriptionViewController: AddDescriptionViewModelDelegate  {
    func reserveSuccess() {
        dismiss(animated: false) {
            //MARK: - Post Notification SaveResult
            self.notificationCenter.post(name: NSNotification.Name("SaveResult"), object: nil, userInfo: nil)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    func reserveFailed() {
        dismiss(animated: false, completion: nil)
    }
}
