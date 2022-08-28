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
    
    let experimentDescription = LabelBuilder()
        .setText("1111111 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,.....", color: .black, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
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
        containerView.addSubview(experimentDescription)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            experimentDescription.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            experimentDescription.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            experimentDescription.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40),
            experimentDescription.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
