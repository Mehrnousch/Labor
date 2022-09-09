//
//  ReservationConfimationView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 01.09.22.
//

import UIKit

class FinalReserveView: UIView {
    
    let pdfsView = PDFsView()
    
    let experimentTitleLabel = LabelBuilder()
        .setText("Bitte geben Sie Ihren Experimenttitel ein:*", color: .black, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    let experimentTitleTextField = TextFieldBuilder()
        .mainSetting(keyboardType: .default, radius: AppTheme.textField.cornerRadius, placeholder: "Title", textAlignment: .left, backGroundColor: .white)
        .setBorderDeselected()
        .build()
    
    let experimentInfoLabel = LabelBuilder()
        .setText("Benötigte Information:", color: .black, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    let experimentInfoTextView = TextViewBuilder()
        .setBorder()
        .isSelectable(true)
        .build()
    
    let agreeRulesButton = CheckBoxButton()
    let existenceManagerButton = CheckBoxButton()
    
    let saveButton = ButtonBuilder()
        .setBackground(AppTheme.view.backGround_red_color)
        .setCornerRadius(AppTheme.view.cornerRadius)
        .setTitle("Reservieren", color: .white)
        .build()

    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        agreeRulesButton.setLabel(label: "Ich habe die Protokolle und Sicherheitsinformationen gelesen und stimme ihnen zu.*")
        existenceManagerButton.setLabel(label: "Ich brauche die Unterstützung des Laborverantwortlichen.")
    }
    
    func layout() {
        addSubview(pdfsView)
        addSubview(experimentTitleLabel)
        addSubview(experimentTitleTextField)
        addSubview(experimentInfoLabel)
        addSubview(experimentInfoTextView)
        addSubview(existenceManagerButton)
        addSubview(agreeRulesButton)
        addSubview(saveButton)
        NSLayoutConstraint.activate([
            pdfsView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            pdfsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pdfsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            experimentTitleLabel.topAnchor.constraint(equalTo: pdfsView.bottomAnchor, constant: 20),
            experimentTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            experimentTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            experimentTitleTextField.topAnchor.constraint(equalTo: experimentTitleLabel.bottomAnchor, constant: 10),
            experimentTitleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            experimentTitleTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            experimentTitleTextField.heightAnchor.constraint(equalToConstant: 44),
            
            experimentInfoLabel.topAnchor.constraint(equalTo: experimentTitleTextField.bottomAnchor, constant: 20),
            experimentInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            experimentInfoLabel.heightAnchor.constraint(equalToConstant: 20),

            experimentInfoTextView.topAnchor.constraint(equalTo: experimentInfoLabel.bottomAnchor, constant: 10),
            experimentInfoTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            experimentInfoTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            agreeRulesButton.topAnchor.constraint(equalTo: experimentInfoTextView.bottomAnchor, constant: 10),
            agreeRulesButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            agreeRulesButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            existenceManagerButton.topAnchor.constraint(equalTo: agreeRulesButton.bottomAnchor, constant: 20),
            existenceManagerButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            existenceManagerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            saveButton.topAnchor.constraint(equalTo: existenceManagerButton.bottomAnchor, constant: 10),
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
