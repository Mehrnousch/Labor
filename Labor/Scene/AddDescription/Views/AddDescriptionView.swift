//
//  AddDescriptionView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import UIKit

class AddDescriptionView: UIView {
    
    let descriptionLabel = LabelBuilder()
        .setText("Note :", color: .black, fontSize: AppTheme.label.normalSize, fontWeight: .bold)
        .build()
    
    let firstDescriptionLabel = DotLabelView()
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
        .setImage(UIImage.init(systemName: "camera") ?? UIImage(named: "camera")!)
        .build()
    
    let nameExperimentTextField = TextFieldBuilder()
        .mainSetting(keyboardType: .default, radius: AppTheme.textField.cornerRadius, placeholder: "Experiment name", textAlignment: .left, backGroundColor: .white)
        .setBorderDeselected()
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
        leftPhotoView.addDashedBorder()
        rightPhotoView.addDashedBorder()
    }
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        leftPhotoView.isUserInteractionEnabled = true
        firstDescriptionLabel.setData(label: "You can add photos of your experiment here.")
        secondDescriptionLabel.setData(label: "Since you can only add two photos, please take the photos correctly and at the right angle.")
        thirdDescriptionLabel.setData(label: "And by clicking on the add text option, you can write a report of your test.")
    }
    
    func layout() {
        addSubview(descriptionLabel)
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
            descriptionLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: AppTheme.view.paddingTop),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppTheme.view.paddingLeft),
            
            firstDescriptionLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            firstDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            firstDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            secondDescriptionLabel.topAnchor.constraint(equalTo: firstDescriptionLabel.bottomAnchor, constant: 4),
            secondDescriptionLabel.leadingAnchor.constraint(equalTo: firstDescriptionLabel.leadingAnchor),
            secondDescriptionLabel.trailingAnchor.constraint(equalTo: firstDescriptionLabel.trailingAnchor),

            thirdDescriptionLabel.topAnchor.constraint(equalTo: secondDescriptionLabel.bottomAnchor, constant: 4),
            thirdDescriptionLabel.leadingAnchor.constraint(equalTo: firstDescriptionLabel.leadingAnchor),
            thirdDescriptionLabel.trailingAnchor.constraint(equalTo: firstDescriptionLabel.trailingAnchor),
            
            nameExperimentTextField.topAnchor.constraint(equalTo: thirdDescriptionLabel.bottomAnchor, constant: 30),
            nameExperimentTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: AppTheme.view.paddingRight),
            nameExperimentTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppTheme.view.paddingLeft),
            nameExperimentTextField.heightAnchor.constraint(equalToConstant: AppTheme.button.height),
            
            leftPhotoView.topAnchor.constraint(equalTo: nameExperimentTextField.bottomAnchor, constant: 20),
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
