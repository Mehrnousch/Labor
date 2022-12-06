//
//  AddDescriptionView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import UIKit

class AddDescriptionView: UIView {
    
    let firstDescriptionLabel = LabelBuilder()
        .setText("Titel:*", color: .black, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    let secondDescriptionLabel = DotLabelView()
    let thirdDescriptionLabel = DotLabelView()
    
    let leftPhotoView = ViewBuilder()
        .build()
    
    let leftPhotoButton = ButtonBuilder()
        .setCornerRadius(AppTheme.imagePicker.cornerRadius)
        .setImage(UIImage.init(systemName: "camera") ?? UIImage(named: "camera")!)
        .build()
    
    let rightPhotoView = ViewBuilder()
        .build()
    
    let rightPhotoButton = ButtonBuilder()
        .setCornerRadius(AppTheme.imagePicker.cornerRadius)
        .setImage(UIImage.init(systemName: "photo") ?? UIImage(named: "gallery")!)
        .build()
    
    let nameExperimentTextField = TextFieldBuilder()
        .mainSetting(keyboardType: .default, radius: AppTheme.textField.cornerRadius, placeholder: "Beschreibungstitel", textAlignment: .left, backGroundColor: .white)
        .setBorderDeselected()
        .build()
    
    let descriptionButton = ButtonBuilder()
        .setBackground(.clear)
        .setBorder(borderWidth: 1, borderColor: AppTheme.view.backGround_red_color.cgColor)
        .setCornerRadius(AppTheme.view.cornerRadius)
        .setTitle("Text hinzufügen", color: AppTheme.view.backGround_red_color)
        .build()
        
    let saveButton = ButtonBuilder()
        .setBackground(AppTheme.view.backGround_red_color)
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
        leftPhotoView.addDashedBorder()
        rightPhotoView.addDashedBorder()
    }
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        leftPhotoView.isUserInteractionEnabled = true
        secondDescriptionLabel.setData(label: "Bitte laden Sie zwei Fotos hoch.*")
        thirdDescriptionLabel.setData(label: "Um Text hinzuzufügen, wählen Sie unten Text hinzufügen aus.")
    }
    
    func layout() {
        addSubview(firstDescriptionLabel)
        addSubview(secondDescriptionLabel)
        addSubview(thirdDescriptionLabel)
        addSubview(nameExperimentTextField)
        addSubview(leftPhotoView)
        leftPhotoView.addSubview(leftPhotoButton)
        addSubview(rightPhotoView)
        rightPhotoView.addSubview(rightPhotoButton)
        addSubview(descriptionButton)
        addSubview(saveButton)
        NSLayoutConstraint.activate([
            thirdDescriptionLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: AppTheme.view.paddingTop),
            thirdDescriptionLabel.leadingAnchor.constraint(equalTo: secondDescriptionLabel.leadingAnchor),
            thirdDescriptionLabel.trailingAnchor.constraint(equalTo: secondDescriptionLabel.trailingAnchor),
            
            firstDescriptionLabel.topAnchor.constraint(equalTo: thirdDescriptionLabel.bottomAnchor, constant: 30),
            firstDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppTheme.view.paddingLeft),
            firstDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: AppTheme.view.paddingRight),
            
            nameExperimentTextField.topAnchor.constraint(equalTo: firstDescriptionLabel.bottomAnchor, constant: 10),
            nameExperimentTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: AppTheme.view.paddingRight),
            nameExperimentTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppTheme.view.paddingLeft),
            nameExperimentTextField.heightAnchor.constraint(equalToConstant: AppTheme.button.height),
            
            
            secondDescriptionLabel.topAnchor.constraint(equalTo: nameExperimentTextField.bottomAnchor, constant: 10),
            secondDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppTheme.view.paddingLeft),
            secondDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: AppTheme.view.paddingRight),
            
            leftPhotoView.topAnchor.constraint(equalTo: secondDescriptionLabel.bottomAnchor, constant: 20),
            leftPhotoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            leftPhotoView.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -15),
            leftPhotoView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            
            leftPhotoButton.heightAnchor.constraint(equalTo: leftPhotoView.heightAnchor, multiplier: AppTheme.imagePicker.hight_width),
            leftPhotoButton.widthAnchor.constraint(equalTo: leftPhotoView.widthAnchor, multiplier: AppTheme.imagePicker.hight_width),
            leftPhotoButton.centerXAnchor.constraint(equalTo: leftPhotoView.centerXAnchor),
            leftPhotoButton.centerYAnchor.constraint(equalTo: leftPhotoView.centerYAnchor),
            
            rightPhotoView.topAnchor.constraint(equalTo: leftPhotoView.topAnchor),
            rightPhotoView.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 15),
            rightPhotoView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            rightPhotoView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            
            rightPhotoButton.heightAnchor.constraint(equalTo: rightPhotoView.heightAnchor, multiplier: AppTheme.imagePicker.hight_width),
            rightPhotoButton.widthAnchor.constraint(equalTo: rightPhotoView.widthAnchor, multiplier: AppTheme.imagePicker.hight_width),
            rightPhotoButton.centerXAnchor.constraint(equalTo: rightPhotoView.centerXAnchor),
            rightPhotoButton.centerYAnchor.constraint(equalTo: rightPhotoView.centerYAnchor),
            
            descriptionButton.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -10),
            descriptionButton.heightAnchor.constraint(equalToConstant: AppTheme.button.height),
            descriptionButton.trailingAnchor.constraint(equalTo: saveButton.trailingAnchor),
            descriptionButton.leadingAnchor.constraint(equalTo: saveButton.leadingAnchor),
            
            saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: AppTheme.view.paddingBottom),
            saveButton.heightAnchor.constraint(equalToConstant: AppTheme.button.height),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: AppTheme.view.paddingRight),
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppTheme.view.paddingLeft),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
