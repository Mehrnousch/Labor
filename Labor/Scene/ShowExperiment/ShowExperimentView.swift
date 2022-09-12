//
//  ShowExperimentView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 04.09.22.
//

import UIKit

class ShowExperimentView: UIView {
    
    let labNameTitle = LabelBuilder()
        .setText("Lab name :", color: .black, fontSize: AppTheme.label.normalSize, fontWeight: .regular)
        .build()
    
    let labName = LabelBuilder()
        .setText("", color: .black, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    let experimentNameTitle = LabelBuilder()
        .setText("Experiment name :", color: .black, fontSize: AppTheme.label.normalSize, fontWeight: .regular)
        .build()
    
    let experimentName = LabelBuilder()
        .setText("", color: .black, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    let experimentDescriptionViewLabel = LabelBuilder()
        .setText("Experiment description :", color: .black, fontSize: AppTheme.label.normalSize, fontWeight: .regular)
        .build()
    
    let experimentDescriptionView = ViewBuilder()
        .setBorder(.darkGray, borderWidth: AppTheme.view.borderWidth)
        .setCornerRadius(AppTheme.view.cornerRadius)
        .build()
    
    let experimentDescription = LabelBuilder()
        .setText("", color: .black, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    let experimentFirstImage = ImageBuilder()
        .build()
    
    let experimentSecoundImage = ImageBuilder()
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }

    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
    }
    
    func setData(result: DetailsEexperimentModel) {
        labName.text = result.reservation.laboratory.name
        experimentName.text = result.name
        experimentDescription.text = result.description
    }
    
    func layout() {
        addSubview(labNameTitle)
        addSubview(labName)
        addSubview(experimentNameTitle)
        addSubview(experimentName)
        addSubview(experimentDescriptionViewLabel)
        addSubview(experimentDescriptionView)
        experimentDescriptionView.addSubview(experimentDescription)
        addSubview(experimentFirstImage)
        addSubview(experimentSecoundImage)
        NSLayoutConstraint.activate([
            labNameTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            labNameTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppTheme.view.paddingLeft),
            labNameTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: AppTheme.view.paddingRight),
            
            labName.topAnchor.constraint(equalTo: labNameTitle.bottomAnchor, constant: 8),
            labName.leadingAnchor.constraint(equalTo: labNameTitle.leadingAnchor),
            labName.trailingAnchor.constraint(equalTo: labNameTitle.trailingAnchor),

            experimentNameTitle.topAnchor.constraint(equalTo: labName.bottomAnchor, constant: 40),
            experimentNameTitle.leadingAnchor.constraint(equalTo: labNameTitle.leadingAnchor),
            experimentNameTitle.trailingAnchor.constraint(equalTo: labNameTitle.trailingAnchor),
            
            experimentName.topAnchor.constraint(equalTo: experimentNameTitle.bottomAnchor, constant: 8),
            experimentName.leadingAnchor.constraint(equalTo: labNameTitle.leadingAnchor),
            experimentName.trailingAnchor.constraint(equalTo: labNameTitle.trailingAnchor),
            
            experimentDescriptionViewLabel.topAnchor.constraint(equalTo: experimentName.bottomAnchor, constant: 40),
            experimentDescriptionViewLabel.leadingAnchor.constraint(equalTo: labName.leadingAnchor),
            
            experimentDescriptionView.topAnchor.constraint(equalTo: experimentDescriptionViewLabel.bottomAnchor, constant: 8),
            experimentDescriptionView.leadingAnchor.constraint(equalTo: labNameTitle.leadingAnchor),
            experimentDescriptionView.trailingAnchor.constraint(equalTo: labNameTitle.trailingAnchor),
            
            experimentDescription.topAnchor.constraint(equalTo: experimentDescriptionView.topAnchor, constant: 10),
            experimentDescription.bottomAnchor.constraint(equalTo: experimentDescriptionView.bottomAnchor, constant: -10),
            experimentDescription.leadingAnchor.constraint(equalTo: experimentDescriptionView.leadingAnchor, constant: 10),
            experimentDescription.trailingAnchor.constraint(equalTo: experimentDescriptionView.trailingAnchor, constant: -10),

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
