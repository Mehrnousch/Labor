//
//  TestExperienceView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 23.08.22.
//

import UIKit

class AddDescriptionView: UIView {
    
    let descriptionLabel = LabelBuilder()
        .setText("Note :", color: .black, fontSize: AppTheme.label.normalSize, fontWeight: .bold)
        .build()
    
    let firstDescriptionLabel = DotLabelView()
    let secondDescriptionLabel = DotLabelView()
    let thirdDescriptionLabel = DotLabelView()
    
    let galleryView = ViewBuilder()
        .build()
    
    let galleryButton = ButtonBuilder()
        .setCornerRadius(AppTheme.button.cornerRadius)
        .setImage(UIImage.init(systemName: "camera") ?? UIImage(named: "camera")!)        .build()
    
    let cameraView = ViewBuilder()
        .build()
    
    let cameraButton = ButtonBuilder()
        .setCornerRadius(AppTheme.button.cornerRadius)
        .setImage(UIImage.init(systemName: "camera") ?? UIImage(named: "camera")!)
        .build()
    
    let descriptionButton = ButtonBuilder()
        .setBackground(.clear)
        .setBorder(borderWidth: 1, borderColor: AppTheme.view.backGround_red_color.cgColor)
        .setCornerRadius(AppTheme.view.cornerRadius)
        .setTitle("Please enter your description", color: AppTheme.view.backGround_red_color)
        .build()
        
    let saveButton = ButtonBuilder()
        .setBackground(AppTheme.view.backGround_red_color)
        .setCornerRadius(AppTheme.view.cornerRadius)
        .setTitle("Save information", color: .white)
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
        
        firstDescriptionLabel.setData(label: "You can add photos of your experiment here.")
        secondDescriptionLabel.setData(label: "Since you can only add two photos, please take the photos correctly and at the right angle.")
        thirdDescriptionLabel.setData(label: "And by clicking on the add text option, you can write a report of your test.")
    }
    
    func layout() {
        addSubview(descriptionLabel)
        addSubview(firstDescriptionLabel)
        addSubview(secondDescriptionLabel)
        addSubview(thirdDescriptionLabel)
        addSubview(galleryView)
        galleryView.addSubview(galleryButton)
        addSubview(cameraView)
        cameraView.addSubview(cameraButton)
        addSubview(descriptionButton)
        addSubview(saveButton)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            firstDescriptionLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            firstDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            firstDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            secondDescriptionLabel.topAnchor.constraint(equalTo: firstDescriptionLabel.bottomAnchor, constant: 4),
            secondDescriptionLabel.leadingAnchor.constraint(equalTo: firstDescriptionLabel.leadingAnchor),
            secondDescriptionLabel.trailingAnchor.constraint(equalTo: firstDescriptionLabel.trailingAnchor),

            thirdDescriptionLabel.topAnchor.constraint(equalTo: secondDescriptionLabel.bottomAnchor, constant: 4),
            thirdDescriptionLabel.leadingAnchor.constraint(equalTo: firstDescriptionLabel.leadingAnchor),
            thirdDescriptionLabel.trailingAnchor.constraint(equalTo: firstDescriptionLabel.trailingAnchor),
            
            galleryView.topAnchor.constraint(equalTo: thirdDescriptionLabel.bottomAnchor, constant: 30),
            galleryView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            galleryView.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -15),
            galleryView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            
            galleryButton.heightAnchor.constraint(equalTo: galleryView.heightAnchor, multiplier: 0.8),
            galleryButton.widthAnchor.constraint(equalTo: galleryView.widthAnchor, multiplier: 0.8),
            galleryButton.centerXAnchor.constraint(equalTo: galleryView.centerXAnchor),
            galleryButton.centerYAnchor.constraint(equalTo: galleryView.centerYAnchor),
            
            cameraView.topAnchor.constraint(equalTo: galleryView.topAnchor),
            cameraView.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 15),
            cameraView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            cameraView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            
            cameraButton.heightAnchor.constraint(equalTo: cameraView.heightAnchor, multiplier: 0.8),
            cameraButton.widthAnchor.constraint(equalTo: cameraView.widthAnchor, multiplier: 0.8),
            cameraButton.centerXAnchor.constraint(equalTo: cameraView.centerXAnchor),
            cameraButton.centerYAnchor.constraint(equalTo: cameraView.centerYAnchor),
            
            descriptionButton.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -10),
            descriptionButton.heightAnchor.constraint(equalToConstant: AppTheme.button.height),
            descriptionButton.trailingAnchor.constraint(equalTo: saveButton.trailingAnchor),
            descriptionButton.leadingAnchor.constraint(equalTo: saveButton.leadingAnchor),
            
            saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: AppTheme.button.height),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
