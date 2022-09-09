//
//  PDFsView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 08.09.22.
//

import UIKit

class PDFsView: UIView {

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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        securityPdfButton.setLabel(label: "Security")
        protocolPdfButton.setLabel(label: "Protocol")
        cleanPdfButton.setLabel(label: "Clean")
    }
    
    func layout() {
        addSubview(generalInformationView)
        generalInformationView.shadow()
        generalInformationView.addSubview(pdfLabel)
        generalInformationView.addSubview(securityPdfButton)
        generalInformationView.addSubview(protocolPdfButton)
        generalInformationView.addSubview(cleanPdfButton)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 160),
            
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
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
