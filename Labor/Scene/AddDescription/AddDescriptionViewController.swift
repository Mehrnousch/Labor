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
        
        baseView.cameraButton.addAction { [weak self] in
            guard let self = self else { return }
            guard let topVC = self.navigationController?.topViewController else { return }
            PhotoHandler.shared.camera(vc: topVC)
        }
        
        baseView.galleryButton.addAction { [weak self] in
            guard let self = self else { return }
            guard let topVC = self.navigationController?.topViewController else { return }
            PhotoHandler.shared.photoLibrary(vc: topVC)
        }
    }
    
    func setupPhoto() {
        
        PhotoHandler.shared.imagePickedBlock = { (image) in
            self.baseView.galleryButton.setImage(image, for: .normal)
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
