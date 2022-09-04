//
//  LabBookTableViewCell.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import UIKit

class LabBookTableViewCell: UITableViewCell {
    
    let containerView = ViewBuilder()
        .setCornerRadius(AppTheme.cell.corner)
        .setBackground(AppTheme.cell.light_gray_color)
        .build()
    
    let experimentName = LabelBuilder()
        .setText("The title of the experiment: ", color: .black, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    let experimentDescription = LabelBuilder()
        .setText("Nothing description ...", color: .black, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentViewStyle()
        layout()
    }
    
    func contentViewStyle() {
        contentView.backgroundColor = .white
    }
    
    func setData(experiment: ExperimentModel) {
        experimentName.text = "The title of the experiment: \(experiment.name)"
        experimentDescription.text = experiment.dascription
    }
    
    func layout() {
        contentView.addSubview(containerView)
        containerView.addSubview(experimentName)
        containerView.addSubview(experimentDescription)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            experimentName.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            experimentName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            experimentName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40),

            experimentDescription.topAnchor.constraint(equalTo: experimentName.bottomAnchor, constant: 20),
            experimentDescription.leadingAnchor.constraint(equalTo: experimentName.leadingAnchor),
            experimentDescription.trailingAnchor.constraint(equalTo: experimentName.trailingAnchor),
            experimentDescription.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
