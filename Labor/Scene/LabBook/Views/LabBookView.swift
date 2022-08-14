//
//  LabBookView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 13.08.22.
//

import UIKit

class LabBookView: UIView {
    
    var list: [String] = []
    let responsibleInfoView = ViewBuilder()
        .setBackground(AppTheme.cell.light_gray_color)
        .setCornerRadius(10)
        .build()
    
    let responsiblePerson = LabelBuilder()
        .setText("Laborverantwortlicher:", color: .black, fontSize: AppTheme.label.normalSize, fontWeight: .bold)
        .build()
    
    let firstResponsiblePerson = LabelBuilder()
        .setText("Frau Abdinian", color: .black, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    let firstResponsiblePersonEmail = LabelBuilder()
        .setText("m.abdinian1989@gmail.com", color: .black, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()

    let secondResponsiblePerson = LabelBuilder()
        .setText("Frau Abdinian", color: .black, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    let secondResponsiblePersonEmail = LabelBuilder()
        .setText("m.abdinian1989@gmail.com", color: .black, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    let pdfView = ViewBuilder()
        .setBackground(AppTheme.cell.light_gray_color)
        .setCornerRadius(10)
        .build()
    
    let pdfLabel = LabelBuilder()
        .setText("Betriebsanweisungen und notwendige Informationen für die Nutzung von Laboren:", color: .black, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    let protocolPdf = ButtonBuilder()
        .setCornerRadius(AppTheme.button.cornerRadius)
        .setImage("pdf")
        .build()

    let securityPdf = ButtonBuilder()
        .setCornerRadius(AppTheme.button.cornerRadius)
        .setImage("pdf")
        .build()
    
    let operatingInstructionPdf = ButtonBuilder()
        .setImage("pdf")
        .setCornerRadius(AppTheme.button.cornerRadius)
        .build()
    
    let LabBookTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = true
        tableView.allowsMultipleSelection = false
        tableView.isScrollEnabled = true
        tableView.layer.masksToBounds = true
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(LabBookTableViewCell.self, forCellReuseIdentifier: "LabBookTableViewCell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }

    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        LabBookTableView.delegate = self
        LabBookTableView.dataSource = self
        
        LabBookTableView.reloadData()
    }
    
    func layout() {
        addSubview(responsibleInfoView)
        responsibleInfoView.addSubview(responsiblePerson)
        responsibleInfoView.addSubview(firstResponsiblePerson)
        responsibleInfoView.addSubview(firstResponsiblePersonEmail)
        responsibleInfoView.addSubview(secondResponsiblePerson)
        responsibleInfoView.addSubview(secondResponsiblePersonEmail)

        addSubview(pdfView)
        pdfView.addSubview(pdfLabel)
        pdfView.addSubview(securityPdf)
        pdfView.addSubview(protocolPdf)
        pdfView.addSubview(operatingInstructionPdf)

        addSubview(LabBookTableView)
        NSLayoutConstraint.activate([
            
            responsibleInfoView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            responsibleInfoView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            responsibleInfoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            responsibleInfoView.heightAnchor.constraint(equalToConstant: 165),
            
            responsiblePerson.topAnchor.constraint(equalTo: responsibleInfoView.topAnchor, constant: 20),
            responsiblePerson.leadingAnchor.constraint(equalTo: responsibleInfoView.leadingAnchor, constant: 20),
            
            firstResponsiblePerson.topAnchor.constraint(equalTo: responsiblePerson.bottomAnchor, constant: 10),
            firstResponsiblePerson.leadingAnchor.constraint(equalTo: responsibleInfoView.leadingAnchor, constant: 20),
            
            firstResponsiblePersonEmail.topAnchor.constraint(equalTo: firstResponsiblePerson.bottomAnchor, constant: 5),
            firstResponsiblePersonEmail.leadingAnchor.constraint(equalTo: responsibleInfoView.leadingAnchor, constant: 20),
            
            secondResponsiblePerson.topAnchor.constraint(equalTo: firstResponsiblePersonEmail.bottomAnchor, constant: 10),
            secondResponsiblePerson.leadingAnchor.constraint(equalTo: responsibleInfoView.leadingAnchor, constant: 20),
            
            secondResponsiblePersonEmail.topAnchor.constraint(equalTo: secondResponsiblePerson.bottomAnchor, constant: 5),
            secondResponsiblePersonEmail.leadingAnchor.constraint(equalTo: responsibleInfoView.leadingAnchor, constant: 20),
            
            
            
            pdfView.topAnchor.constraint(equalTo: responsibleInfoView.bottomAnchor, constant: 10),
            pdfView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            pdfView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            pdfView.heightAnchor.constraint(equalToConstant: 130),
            
            pdfLabel.topAnchor.constraint(equalTo: pdfView.topAnchor, constant: 20),
            pdfLabel.leadingAnchor.constraint(equalTo: pdfView.leadingAnchor, constant: 20),
            pdfLabel.trailingAnchor.constraint(equalTo: pdfView.trailingAnchor, constant: -20),
            
            
            securityPdf.topAnchor.constraint(equalTo: pdfLabel.bottomAnchor, constant: 10),
            securityPdf.leadingAnchor.constraint(equalTo: pdfView.leadingAnchor, constant: 20),
            securityPdf.heightAnchor.constraint(equalToConstant: 44),
            securityPdf.widthAnchor.constraint(equalToConstant: 44),

            protocolPdf.topAnchor.constraint(equalTo: pdfLabel.bottomAnchor, constant: 10),
            protocolPdf.centerXAnchor.constraint(equalTo: pdfView.centerXAnchor),
            protocolPdf.heightAnchor.constraint(equalToConstant: 44),
            protocolPdf.widthAnchor.constraint(equalToConstant: 44),
            
            operatingInstructionPdf.topAnchor.constraint(equalTo: pdfLabel.bottomAnchor, constant: 10),
            operatingInstructionPdf.trailingAnchor.constraint(equalTo: pdfView.trailingAnchor, constant: -20),
            operatingInstructionPdf.heightAnchor.constraint(equalToConstant: 44),
            operatingInstructionPdf.widthAnchor.constraint(equalToConstant: 44),
            
            LabBookTableView.topAnchor.constraint(equalTo: pdfView.bottomAnchor, constant: 20),
            LabBookTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            LabBookTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            LabBookTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Delegate & DataSource
extension LabBookView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabBookTableViewCell", for: indexPath) as! LabBookTableViewCell
//        let cellRow = list[indexPath.row]

        return cell
    }
}

