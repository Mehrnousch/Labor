//
//  ReservationConfimationView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 01.09.22.
//

import UIKit

class FinalReserveView: UIView {
    
    let generalInformationView = ViewBuilder()
        .setBackground(AppTheme.cell.light_gray_color)
        .setCornerRadius(20, onlyTop: false, onlyBottom: true)
        .build()

    let pdfLabel = LabelBuilder()
        .setText("Betriebsanweisungen und notwendige Informationen für die Nutzung von Laboren:", color: .black, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    let securityPdfButton = PDFButton()
    let protocolPdfButton = PDFButton()
    let cleanPdfButton = PDFButton()
    
    
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
        
        securityPdfButton.setLabel(label: "Security")
        protocolPdfButton.setLabel(label: "Protocol")
        cleanPdfButton.setLabel(label: "Clean")
        
        agreeRulesButton.setLabel(label: "I read all the rules and agree with them.")
        existenceManagerButton.setLabel(label: "I need the support of the laboratory manager.")
    }
    
    func layout() {
        addSubview(generalInformationView)
        generalInformationView.shadow()
        generalInformationView.addSubview(pdfLabel)
        generalInformationView.addSubview(securityPdfButton)
        generalInformationView.addSubview(protocolPdfButton)
        generalInformationView.addSubview(cleanPdfButton)
        addSubview(experimentTitleLabel)
        addSubview(experimentTitleTextField)
        addSubview(experimentInfoLabel)
        addSubview(experimentInfoTextView)
        addSubview(existenceManagerButton)
        addSubview(agreeRulesButton)
        addSubview(saveButton)
        NSLayoutConstraint.activate([
            generalInformationView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            generalInformationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            generalInformationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            generalInformationView.heightAnchor.constraint(equalToConstant: 160),
            
            pdfLabel.topAnchor.constraint(equalTo: generalInformationView.topAnchor, constant: 20),
            pdfLabel.leadingAnchor.constraint(equalTo: generalInformationView.leadingAnchor, constant: 20),
            pdfLabel.trailingAnchor.constraint(equalTo: generalInformationView.trailingAnchor, constant: -20),
            
            securityPdfButton.topAnchor.constraint(equalTo: pdfLabel.bottomAnchor, constant: 30),
            securityPdfButton.bottomAnchor.constraint(equalTo: generalInformationView.bottomAnchor, constant: -20),
            securityPdfButton.leadingAnchor.constraint(equalTo: generalInformationView.leadingAnchor),
            securityPdfButton.heightAnchor.constraint(equalToConstant: AppTheme.button.hight_width_PdfButton),
            securityPdfButton.widthAnchor.constraint(equalToConstant: generalInformationView.bounds.width / 3),
            
            protocolPdfButton.topAnchor.constraint(equalTo: securityPdfButton.topAnchor),
            protocolPdfButton.bottomAnchor.constraint(equalTo: securityPdfButton.bottomAnchor),
            protocolPdfButton.leadingAnchor.constraint(equalTo: securityPdfButton.trailingAnchor),
            protocolPdfButton.trailingAnchor.constraint(equalTo: cleanPdfButton.leadingAnchor),
            protocolPdfButton.heightAnchor.constraint(equalToConstant: AppTheme.button.hight_width_PdfButton),
            protocolPdfButton.widthAnchor.constraint(equalTo: securityPdfButton.widthAnchor, multiplier: 1),
            
            cleanPdfButton.topAnchor.constraint(equalTo: securityPdfButton.topAnchor),
            cleanPdfButton.bottomAnchor.constraint(equalTo: securityPdfButton.bottomAnchor),
            cleanPdfButton.trailingAnchor.constraint(equalTo: generalInformationView.trailingAnchor),
            cleanPdfButton.heightAnchor.constraint(equalToConstant: AppTheme.button.hight_width_PdfButton),
            cleanPdfButton.widthAnchor.constraint(equalTo: securityPdfButton.widthAnchor, multiplier: 1),
            
            
            experimentTitleLabel.topAnchor.constraint(equalTo: generalInformationView.bottomAnchor, constant: 20),
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
