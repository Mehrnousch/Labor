//
//  ShowExperimentViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 04.09.22.
//

import UIKit
import Kingfisher

class ShowExperimentViewController: UIViewController {
    
    var coordinator: ShowExperimentCoordinator?
    private lazy var viewModel: ShowExperimentViewModel = {
        let vm = ShowExperimentViewModel()
        vm.delegate = self
        return vm
    }()
    let baseView = ShowExperimentView()
    private let loadingVC = LoadingViewController()
    var reservationId: Int?
    var experimentId: Int?
    var photosDetailes = [PhotoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigtionBarConfigure()
        presentLoadingVC()

        if let reservationId = reservationId, let experimentId = experimentId {
            if reservationId != 0, experimentId != 0 {
                
                print("!!@@ reservationId \(reservationId)")
                print("!!@@ experimentId \(experimentId)")
                viewModel.showExperiment(reservationId: reservationId, experimentId: experimentId)
            }
        }
        layout()
    }
    
    func navigtionBarConfigure() {
        title = "Beschreibung des Experiments"
    }
    
    func downloadImage() {
        let modifier = AnyModifier { request in
            var r = request
            r.setValue("Bearer " + (KeyChainStorage.getToken()), forHTTPHeaderField:"Authorization")
            return r
        }
        
        if !photosDetailes.isEmpty {
            for id in 0..<photosDetailes.count {
                switch id {
                case 0:
                    let url = ApiConstants.downloadFile(id: photosDetailes[0].id)
                    baseView.experimentFirstImage.kf.setImage(with: url, placeholder: UIImage(named: ""), options: [.requestModifier(modifier)])
                case 1:
                    let url = ApiConstants.downloadFile(id: photosDetailes[1].id)
                    baseView.experimentSecoundImage.kf.setImage(with: url, placeholder: UIImage(named: ""), options: [.requestModifier(modifier)])
                default:
                    break
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
    
    private func presentLoadingVC() {
        loadingVC.modalTransitionStyle = .crossDissolve
        loadingVC.modalPresentationStyle = .overFullScreen
        present(loadingVC, animated: false, completion: nil)
    }
}


//MARK: - ViewModelDelegate
extension ShowExperimentViewController: ShowExperimentViewModelDelegate {
    func showExperimentSuccessful(result: DetailsEexperimentModel) {
        self.baseView.setData(result: result)
        self.loadingVC.dismiss(animated: true, completion: nil)
    }
    
    func photosId(photoModel: [PhotoModel]) {
        self.photosDetailes = photoModel
        downloadImage()
    }
    
    func showExperimentFailed() {
        self.loadingVC.dismiss(animated: true, completion: nil)
    }
}
