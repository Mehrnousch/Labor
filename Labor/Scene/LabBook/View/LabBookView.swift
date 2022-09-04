//
//  LabBookView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import UIKit

class LabBookView: UIView {
    
    var selectedCell: ()-> Void = {}

    let generalInformationView = ViewBuilder()
        .setBackground(AppTheme.cell.light_gray_color)
        .setCornerRadius(20, onlyTop: false, onlyBottom: true)
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
    
    var experiments: [ExperimentModel] = []
    let DetailesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.contentInset = UIEdgeInsets(top: 14,left: 0,bottom: 0,right: 0)
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
    
    func setData(experiments: [ExperimentModel]) {
        self.experiments = experiments
        DetailesTableView.reloadData()
    }

    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        generalInformationView.shadow()
        DetailesTableView.delegate = self
        DetailesTableView.dataSource = self
    }
    
    func layout() {
        addSubview(DetailesTableView)
        addSubview(generalInformationView)
        generalInformationView.addSubview(responsiblePerson)
        generalInformationView.addSubview(firstResponsiblePerson)
        generalInformationView.addSubview(firstResponsiblePersonEmail)
        generalInformationView.addSubview(secondResponsiblePerson)
        generalInformationView.addSubview(secondResponsiblePersonEmail)
        generalInformationView.addSubview(pdfLabel)
        generalInformationView.addSubview(securityPdf)
        securityPdf.addSubview(securityPdfImage)
        generalInformationView.addSubview(protocolPdf)
        protocolPdf.addSubview(protocolPdfImage)
        generalInformationView.addSubview(operatingInstructionPdf)
        operatingInstructionPdf.addSubview(operatingInstructionPdfImage)
        NSLayoutConstraint.activate([
            generalInformationView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            generalInformationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            generalInformationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            responsiblePerson.topAnchor.constraint(equalTo: generalInformationView.topAnchor, constant: 20),
            responsiblePerson.leadingAnchor.constraint(equalTo: generalInformationView.leadingAnchor, constant: 20),
            responsiblePerson.trailingAnchor.constraint(equalTo: generalInformationView.trailingAnchor, constant: -20),
            
            firstResponsiblePerson.topAnchor.constraint(equalTo: responsiblePerson.bottomAnchor, constant: 10),
            firstResponsiblePerson.leadingAnchor.constraint(equalTo: responsiblePerson.leadingAnchor),
            firstResponsiblePerson.trailingAnchor.constraint(equalTo: responsiblePerson.trailingAnchor),

            firstResponsiblePersonEmail.topAnchor.constraint(equalTo: firstResponsiblePerson.bottomAnchor, constant: 5),
            firstResponsiblePersonEmail.leadingAnchor.constraint(equalTo: responsiblePerson.leadingAnchor),
            firstResponsiblePersonEmail.trailingAnchor.constraint(equalTo: responsiblePerson.trailingAnchor),

            secondResponsiblePerson.topAnchor.constraint(equalTo: firstResponsiblePersonEmail.bottomAnchor, constant: 10),
            secondResponsiblePerson.leadingAnchor.constraint(equalTo: responsiblePerson.leadingAnchor),
            secondResponsiblePerson.trailingAnchor.constraint(equalTo: responsiblePerson.trailingAnchor),

            secondResponsiblePersonEmail.topAnchor.constraint(equalTo: secondResponsiblePerson.bottomAnchor, constant: 5),
            secondResponsiblePersonEmail.leadingAnchor.constraint(equalTo: responsiblePerson.leadingAnchor),
            secondResponsiblePersonEmail.trailingAnchor.constraint(equalTo: responsiblePerson.trailingAnchor),
            
            pdfLabel.topAnchor.constraint(equalTo: secondResponsiblePersonEmail.topAnchor, constant: 50),
            pdfLabel.leadingAnchor.constraint(equalTo: responsiblePerson.leadingAnchor),
            pdfLabel.trailingAnchor.constraint(equalTo: responsiblePerson.trailingAnchor),
            
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
            
            DetailesTableView.topAnchor.constraint(equalTo: generalInformationView.bottomAnchor),
            DetailesTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            DetailesTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            DetailesTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Delegate & DataSource
extension LabBookView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return experiments.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabBookTableViewCell", for: indexPath) as! LabBookTableViewCell
        let cellRow = experiments[indexPath.row]
        cell.setData(experiment: cellRow)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! LabBookTableViewCell
        cell.selectionStyle = .none
        selectedCell()
    }
}
