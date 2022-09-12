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
    
    let experimentNameTitle = LabelBuilder()
        .setText("Experiment name :", color: .black, fontSize: AppTheme.label.normalSize, fontWeight: .regular)
        .build()
    
    let experimentName = LabelBuilder()
        .setText("", color: .black, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    let experimentDescriptionTitle = LabelBuilder()
        .setText("Experiment description :", color: .black, fontSize: AppTheme.label.normalSize, fontWeight: .regular)
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
        experimentName.numberOfLines = 1
        experimentDescription.numberOfLines = 1
    }
    
    func setData(experiment: ExperimentModel) {
        experimentName.text = experiment.name
        let dascription = experiment.dascription
        if dascription != "" {
            experimentDescription.text = experiment.dascription
        } else {
            experimentDescription.text = "There is no description of the experiment."
        }
    }
    
    func layout() {
        contentView.addSubview(containerView)
        containerView.addSubview(experimentNameTitle)
        containerView.addSubview(experimentName)
        containerView.addSubview(experimentDescriptionTitle)
        containerView.addSubview(experimentDescription)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            experimentNameTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            experimentNameTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: AppTheme.view.paddingLeft),
            experimentNameTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: AppTheme.view.paddingRight),
            
            experimentName.topAnchor.constraint(equalTo: experimentNameTitle.bottomAnchor, constant: 2),
            experimentName.leadingAnchor.constraint(equalTo: experimentNameTitle.leadingAnchor),
            experimentName.trailingAnchor.constraint(equalTo: experimentNameTitle.trailingAnchor),
            
            experimentDescriptionTitle.topAnchor.constraint(equalTo: experimentName.bottomAnchor, constant: 22),
            experimentDescriptionTitle.leadingAnchor.constraint(equalTo: experimentNameTitle.leadingAnchor),
            experimentDescriptionTitle.trailingAnchor.constraint(equalTo: experimentNameTitle.trailingAnchor),
            
            experimentDescription.topAnchor.constraint(equalTo: experimentDescriptionTitle.bottomAnchor, constant: 6),
            experimentDescription.leadingAnchor.constraint(equalTo: experimentNameTitle.leadingAnchor),
            experimentDescription.trailingAnchor.constraint(equalTo: experimentNameTitle.trailingAnchor),
            experimentDescription.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
