//
//  TestExperienceView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 23.08.22.
//

import UIKit

class AddDescriptionView: UIView {
    
    let galleryView = ViewBuilder()
        .build()
    
    let galleryButton = ButtonBuilder()
        .setCornerRadius(AppTheme.button.cornerRadius)
        .setImage(UIImage(systemName: "photo")!)
        .build()
    
    let galleryImage = ImageBuilder()
        .build()
    
    let galleryLabel = LabelBuilder()
        .setText("Galerie", color: .darkGray, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    let cameraView = ViewBuilder()
        .build()
    
    let cameraButton = ButtonBuilder()
        .setCornerRadius(AppTheme.button.cornerRadius)
        .setImage(UIImage(systemName: "camera")!)
        .build()
    
    let cameraImage = ImageBuilder()
        .build()

    let cameraLabel = LabelBuilder()
        .setText("Machen Sie ein Foto", color: .darkGray, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    let typingView = TypingView()
    
    let sendMessageButton = ButtonBuilder()
        .setBackground(AppTheme.button.backGround_color)
        .setCornerRadius(AppTheme.view.cornerRadius)
        .setTitle("Senden", color: .white)
        .build()

    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        galleryView.addDashedBorder()
        cameraView.addDashedBorder()
    }
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        typingView.layer.cornerRadius = AppTheme.view.cornerRadius
        typingView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        typingView.layer.shadowOpacity = 1
        typingView.layer.shadowRadius = 20
        typingView.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    func layout() {
        addSubview(typingView)
        addSubview(galleryView)
        galleryView.addSubview(galleryButton)
        galleryButton.addSubview(galleryImage)
        galleryButton.addSubview(galleryLabel)
        addSubview(cameraView)
        cameraView.addSubview(cameraButton)
        cameraButton.addSubview(cameraImage)
        cameraButton.addSubview(cameraLabel)
        addSubview(sendMessageButton)
        NSLayoutConstraint.activate([
            typingView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            typingView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            typingView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            
            galleryView.bottomAnchor.constraint(equalTo: sendMessageButton.topAnchor, constant: -40),
            galleryView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            galleryView.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -15),
            galleryView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            
            galleryButton.heightAnchor.constraint(equalTo: galleryView.heightAnchor, multiplier: 0.8),
            galleryButton.widthAnchor.constraint(equalTo: galleryView.widthAnchor, multiplier: 0.8),
            galleryButton.centerXAnchor.constraint(equalTo: galleryView.centerXAnchor),
            galleryButton.centerYAnchor.constraint(equalTo: galleryView.centerYAnchor),
            
            galleryImage.centerXAnchor.constraint(equalTo: galleryButton.centerXAnchor),
            galleryImage.centerYAnchor.constraint(equalTo: galleryButton.centerYAnchor),

            galleryLabel.topAnchor.constraint(equalTo: galleryImage.bottomAnchor, constant: 16),
            galleryLabel.centerXAnchor.constraint(equalTo: galleryButton.centerXAnchor),
            
            cameraView.bottomAnchor.constraint(equalTo: galleryView.bottomAnchor),
            cameraView.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 15),
            cameraView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            cameraView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            
            cameraButton.heightAnchor.constraint(equalTo: cameraView.heightAnchor, multiplier: 0.8),
            cameraButton.widthAnchor.constraint(equalTo: cameraView.widthAnchor, multiplier: 0.8),
            cameraButton.centerXAnchor.constraint(equalTo: cameraView.centerXAnchor),
            cameraButton.centerYAnchor.constraint(equalTo: cameraView.centerYAnchor),
            
            cameraImage.centerXAnchor.constraint(equalTo: cameraButton.centerXAnchor),
            cameraImage.centerYAnchor.constraint(equalTo: cameraButton.centerYAnchor),
            
            cameraLabel.topAnchor.constraint(equalTo: cameraImage.bottomAnchor, constant: 16),
            cameraLabel.centerXAnchor.constraint(equalTo: cameraButton.centerXAnchor),
            
            sendMessageButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            sendMessageButton.heightAnchor.constraint(equalToConstant: AppTheme.button.height),
            sendMessageButton.trailingAnchor.constraint(equalTo: typingView.trailingAnchor),
            sendMessageButton.leadingAnchor.constraint(equalTo: typingView.leadingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
