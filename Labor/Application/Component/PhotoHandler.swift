//
//  PhotoHandler.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//


import UIKit
import CropViewController
import TOCropViewController
import PhotosUI

/**
 Handle camera stuffs (Choose avatar specialy)
 */
class PhotoHandler: NSObject {
    static let shared = PhotoHandler()
    
    var didTapDeleteAvatar: ()-> Void = { }
    var alertCmeraAccessNeeded: ()-> Void = { }
    var alertGalleryAccessNeeded: ()-> Void = { }
    let myPickerController = UIImagePickerController()
        
    fileprivate var currentVC: UIViewController!
    //MARK: Internal Properties
    var imagePickedBlock: ((UIImage) -> Void)?
    
    /// Presents camera
    func camera(vc: UIViewController) {
        currentVC = vc
        
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch (status)
        {
        case .authorized:
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                
                DispatchQueue.main.async {
                    self.myPickerController.delegate = self
                    self.myPickerController.sourceType = .camera
                    self.myPickerController.allowsEditing = false
                    self.currentVC.present(self.myPickerController, animated: true, completion: nil)
                }
            }
            
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
                if response {
                    //access granted
                    self.camera(vc: vc)
                } else {
                    
                }
            }
            
        case .denied:
            alertCmeraAccessNeeded()
            
        case .restricted:
            break
        @unknown default:
            fatalError()
        }
    }
    
    /// Presents photo library for select a photo
    func photoLibrary(vc: UIViewController) {
        
        currentVC = vc
        
        let status = PHPhotoLibrary.authorizationStatus()
        switch (status) {
        case .authorized:
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                
                DispatchQueue.main.async {
                    self.myPickerController.delegate = self
                    self.myPickerController.sourceType = .photoLibrary
                    self.myPickerController.allowsEditing = true
                    self.currentVC.present(self.myPickerController, animated: true, completion: nil)
                }
            }
            
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                switch status {
                    
                case .notDetermined:
                    break
                    
                case .restricted:
                    break
                    
                case .denied:
                    break
                    
                case .authorized:
                    self.photoLibrary(vc: vc)
                    
                case .limited:
                    self.photoLibrary(vc: vc)
                    
                @unknown default:
                    break
                }
            }
            
        case .denied:
            alertGalleryAccessNeeded()
        case .restricted:
            break
        default:
            fatalError()
        }
    }
    
    
    func removePhoto() {
        didTapDeleteAvatar()
    }
    
    /**
     Present action sheet to select camera or photo library
     - Parameters:
     - vc: Parent viewController
     */
    func showActionSheet(vc: UIViewController) {
        currentVC = vc
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (alert:UIAlertAction!) -> Void in
        }))
        
        let galleryAction = UIAlertAction(title: "Gallery", style: .default, handler: { (alert:UIAlertAction!) -> Void in
        })
        actionSheet.addAction(galleryAction)
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        vc.present(actionSheet, animated: true, completion: nil)
    }
}

// Handle esponse from photo library
extension PhotoHandler: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        currentVC.dismiss(animated: true, completion: nil)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            myPickerController.dismiss(animated: true, completion: nil)
            let cropVC = TOCropViewController(image: pickedImage)
            cropVC.delegate = self
            cropVC.aspectRatioPickerButtonHidden = true
            cropVC.aspectRatioPreset = .presetSquare
            cropVC.aspectRatioLockEnabled = false
            cropVC.resetAspectRatioEnabled = false
            self.currentVC.present(cropVC, animated: true, completion: nil)
        }
    }
}

extension PhotoHandler: TOCropViewControllerDelegate {
    func cropViewController(_ cropViewController: TOCropViewController, didCropTo image: UIImage, with cropRect: CGRect, angle: Int) {
        self.imagePickedBlock?(image)
        currentVC.dismiss(animated: true, completion: nil)
    }
}
