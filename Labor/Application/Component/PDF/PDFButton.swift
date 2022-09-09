//
//  PDFButton.swift
//  Labor
//
//  Created by mehrnoush abdinian on 08.09.22.
//

import UIKit

class PDFButton: UIButton {
    
    let pdfLabel = LabelBuilder()
        .setText("Protocol PDF", color: .black, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    let pdfImage = ImageBuilder()
        .setImage("pdf")
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        pdfImage.isUserInteractionEnabled = false
        layout()
    }
    
    func setLabel(label: String) {
        pdfLabel.text = label
    }
    
    func layout() {
        addSubview(pdfLabel)
        addSubview(pdfImage)
        NSLayoutConstraint.activate([
            pdfLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            pdfLabel.topAnchor.constraint(equalTo: topAnchor),
            
            pdfImage.topAnchor.constraint(equalTo: pdfLabel.bottomAnchor, constant: 6),
            pdfImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            pdfImage.widthAnchor.constraint(equalToConstant: 30),
            pdfImage.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
