//
//  labsTableViewCell.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//


import UIKit

class labsTableViewCell: UITableViewCell {
    
    let containerView = ViewBuilder()
        .setCornerRadius(AppTheme.cell.corner)
        .setBackground(AppTheme.cell.light_gray_color)
        .build()
    
    let laboratoryName = LabelBuilder()
        .setText("lab NaExe", color: .black, fontSize: AppTheme.label.normalSize, fontWeight: .bold)
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
        containerView.addSubview(laboratoryName)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            laboratoryName.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            laboratoryName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            laboratoryName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40),
            laboratoryName.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
