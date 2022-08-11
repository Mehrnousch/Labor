//
//  ExperimenteTableViewCell.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//


import UIKit

class ExperimenteTableViewCell: UITableViewCell {
    
    let containerView = ViewBuilder()
        .setCornerRadius(AppTheme.cell.corner)
        .setBackground(AppTheme.cell.light_gray_color)
        .build()
    
    let labName = LabelBuilder()
        .setText("lab NaExperiExperimentExperimentExperimentExperimentExperimentExperimentmentme", color: .black, fontSize: AppTheme.label.normalSize, fontWeight: .bold)
        .build()
    
    let titleExperiment = LabelBuilder()
        .setText("title ExperiExperimentExperimentExperimentExperimentExperimentExperimentment", color: .black, fontSize: AppTheme.label.maximumSize, fontWeight: .bold)
        .build()
    
    let containerDateExperiment = ViewBuilder()
        .setBackground(.white)
        .setCornerRadius(4)
        .build()
    
    let dateExperiment = LabelBuilder()
        .setText("date", color: .black, fontSize: AppTheme.label.minimumSize, fontWeight: .bold)
        .setBackground(.white)
        .setCornerRadius(4)
        .build()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentViewStyle()
        layout()
    }
    
    func contentViewStyle() {
        contentView.backgroundColor = .white
    }
    
    func setData() {
        
    }
    
    func layout() {
        contentView.addSubview(containerView)
        containerView.addSubview(labName)
        containerView.addSubview(titleExperiment)
        containerView.addSubview(dateExperiment)
//        containerDateExperiment.addSubview(dateExperiment)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            labName.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            labName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            labName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40),

            titleExperiment.topAnchor.constraint(equalTo: labName.bottomAnchor, constant: 10),
            titleExperiment.leadingAnchor.constraint(equalTo: labName.leadingAnchor),
            titleExperiment.trailingAnchor.constraint(equalTo: labName.trailingAnchor),
            
            dateExperiment.topAnchor.constraint(equalTo: titleExperiment.bottomAnchor, constant: 20),
            dateExperiment.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            dateExperiment.leadingAnchor.constraint(equalTo: labName.leadingAnchor),
            dateExperiment.trailingAnchor.constraint(equalTo: labName.trailingAnchor),
//
//            dateExperiment.topAnchor.constraint(equalTo: containerDateExperiment.topAnchor, constant: 2),
//            dateExperiment.bottomAnchor.constraint(equalTo: containerDateExperiment.bottomAnchor, constant: -2),
//            dateExperiment.trailingAnchor.constraint(equalTo: labName.trailingAnchor, constant: 6),
//            dateExperiment.leadingAnchor.constraint(equalTo: containerDateExperiment.leadingAnchor, constant: 6),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
