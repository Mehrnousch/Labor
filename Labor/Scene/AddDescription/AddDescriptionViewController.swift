//
//  AddDescriptionViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import UIKit

class AddDescriptionViewController: UIViewController {
    
    var coordinator: AddDescriptionCoordinator?
    let baseView = AddDescriptionView()
    var chosenLeftPhotoPlace = false
    var chosenRightPhotoPlace = false
    
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
            } else {
                self.baseView.rightPhotoButton.setImage(image, for: .normal)
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
}


extension AddDescriptionViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    
}
