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
    
    
    let protocolPdf = ButtonBuilder()
        .build()
    
    let protocolPdfImage = ImageBuilder()
        .setImage("pdf")
        .build()
    
    
    let securityPdf = ButtonBuilder()
        .build()
    
    let securityPdfImage = ImageBuilder()
        .setImage("pdf")
        .build()
    
    
    let operatingInstructionPdf = ButtonBuilder()
        .build()
    
    let operatingInstructionPdfImage = ImageBuilder()
        .setImage("pdf")
        .build()
    
    
    
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
    let experimentInfoTextField = TextViewBuilder()
        .setBorder()
        .isSelectable(true)
        .build()
    
    
   
    
    
   
    let existenceManagerButton = CheckBoxButton()
    let agreeRulesButton = CheckBoxButton()
    
   
    
   
    
    
    
        
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
    }
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        agreeRulesButton.setLabel(label: "Ich habe die Protokolle und Sicherheitsinformationen gelesen und stimme ihnen zu.*")
        existenceManagerButton.setLabel(label: "Ich brauche die Unterstützung des Laborverantwortlichen.")
        
        
    }
    
    func layout() {
        
        addSubview(generalInformationView)
        generalInformationView.shadow()

        generalInformationView.addSubview(pdfLabel)
        generalInformationView.addSubview(securityPdf)
        securityPdf.addSubview(securityPdfImage)
        generalInformationView.addSubview(protocolPdf)
        protocolPdf.addSubview(protocolPdfImage)
        generalInformationView.addSubview(operatingInstructionPdf)
        operatingInstructionPdf.addSubview(operatingInstructionPdfImage)
        addSubview(experimentTitleLabel)
        addSubview(experimentTitleTextField)
        addSubview(experimentInfoLabel)
        addSubview(experimentInfoTextField)
        addSubview(existenceManagerButton)
        addSubview(agreeRulesButton)
        
        addSubview(saveButton)
        NSLayoutConstraint.activate([
            
            generalInformationView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            generalInformationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            generalInformationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            pdfLabel.topAnchor.constraint(equalTo: generalInformationView.topAnchor, constant: 20),
            pdfLabel.leadingAnchor.constraint(equalTo: generalInformationView.leadingAnchor, constant: 20),
            pdfLabel.trailingAnchor.constraint(equalTo: generalInformationView.trailingAnchor, constant: -20),
            
            securityPdf.topAnchor.constraint(equalTo: pdfLabel.bottomAnchor, constant: 30),
            securityPdf.bottomAnchor.constraint(equalTo: generalInformationView.bottomAnchor, constant: -20),
            securityPdf.leadingAnchor.constraint(equalTo: generalInformationView.leadingAnchor),
            securityPdf.heightAnchor.constraint(equalToConstant: AppTheme.button.hight_width_PdfButton),
            securityPdf.widthAnchor.constraint(equalToConstant: generalInformationView.bounds.width / 3),
            
            securityPdfImage.centerXAnchor.constraint(equalTo: securityPdf.centerXAnchor),
            securityPdfImage.centerYAnchor.constraint(equalTo: securityPdf.centerYAnchor),
            securityPdfImage.widthAnchor.constraint(equalToConstant: AppTheme.button.hight_width_PdfButton),
            securityPdfImage.heightAnchor.constraint(equalToConstant: AppTheme.button.hight_width_PdfButton),

            protocolPdf.topAnchor.constraint(equalTo: securityPdf.topAnchor),
            protocolPdf.bottomAnchor.constraint(equalTo: securityPdf.bottomAnchor),
            protocolPdf.leadingAnchor.constraint(equalTo: securityPdf.trailingAnchor),
            protocolPdf.trailingAnchor.constraint(equalTo: operatingInstructionPdf.leadingAnchor),
            protocolPdf.heightAnchor.constraint(equalToConstant: AppTheme.button.hight_width_PdfButton),
            protocolPdf.widthAnchor.constraint(equalTo: securityPdf.widthAnchor, multiplier: 1),

            protocolPdfImage.centerXAnchor.constraint(equalTo: protocolPdf.centerXAnchor),
            protocolPdfImage.centerYAnchor.constraint(equalTo: protocolPdf.centerYAnchor),
            protocolPdfImage.widthAnchor.constraint(equalToConstant: AppTheme.button.hight_width_PdfButton),
            protocolPdfImage.heightAnchor.constraint(equalToConstant: AppTheme.button.hight_width_PdfButton),
            
            operatingInstructionPdf.topAnchor.constraint(equalTo: securityPdf.topAnchor),
            operatingInstructionPdf.bottomAnchor.constraint(equalTo: securityPdf.bottomAnchor),
            operatingInstructionPdf.trailingAnchor.constraint(equalTo: generalInformationView.trailingAnchor),
            operatingInstructionPdf.heightAnchor.constraint(equalToConstant: AppTheme.button.hight_width_PdfButton),
            operatingInstructionPdf.widthAnchor.constraint(equalTo: securityPdf.widthAnchor, multiplier: 1),
            
            operatingInstructionPdfImage.centerXAnchor.constraint(equalTo: operatingInstructionPdf.centerXAnchor),
            operatingInstructionPdfImage.centerYAnchor.constraint(equalTo: operatingInstructionPdf.centerYAnchor),
            operatingInstructionPdfImage.widthAnchor.constraint(equalToConstant: AppTheme.button.hight_width_PdfButton),
            operatingInstructionPdfImage.heightAnchor.constraint(equalToConstant: AppTheme.button.hight_width_PdfButton),
            experimentTitleLabel.topAnchor.constraint(equalTo: generalInformationView.bottomAnchor, constant: 20),
            experimentTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            experimentTitleTextField.topAnchor.constraint(equalTo: experimentTitleLabel.bottomAnchor, constant: 10),
            experimentTitleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            experimentTitleTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            experimentTitleTextField.heightAnchor.constraint(equalToConstant: 44),
            
            experimentInfoLabel.topAnchor.constraint(equalTo: experimentTitleTextField.bottomAnchor, constant: 20),
            experimentInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            experimentInfoTextField.topAnchor.constraint(equalTo: experimentInfoLabel.bottomAnchor, constant: 10),
            experimentInfoTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            experimentInfoTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            experimentInfoTextField.heightAnchor.constraint(equalToConstant: 88),
            
            
            
           
           
           
            
            agreeRulesButton.bottomAnchor.constraint(equalTo: existenceManagerButton.topAnchor, constant: -10),
            agreeRulesButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            agreeRulesButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            existenceManagerButton.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -20),
            existenceManagerButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            existenceManagerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

           
            
            
            
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



