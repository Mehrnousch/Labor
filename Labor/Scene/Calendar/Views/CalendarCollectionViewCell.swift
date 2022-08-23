//
//  CalendarCollectionViewCell.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//


import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    let borderView = ViewBuilder()
        .setCornerRadius(AppTheme.view.cornerRadius)
        .setBorder(AppTheme.textField.borderColor)
        .setBackground(.white)
        .build()
    
    let containerTimeView = ViewBuilder()
        .setCornerRadius(AppTheme.view.cornerRadius)
        .setBackground(AppTheme.view.backGround_blue_color)
        .build()
    
    let timeLabel = LabelBuilder()
        .setText("08:00", color: .black, fontSize: AppTheme.label.minimumSize, fontWeight: .bold)
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        cellStyle()
        layout()
    }
    
    private func cellStyle()  {
        translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .blue
    }
    
    private func layout() {
        contentView.addSubview(borderView)
        contentView.addSubview(containerTimeView)
        containerTimeView.addSubview(timeLabel)
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            borderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            borderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            borderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            containerTimeView.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 10),
            containerTimeView.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -10),
            containerTimeView.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -10),
            containerTimeView.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 10),
            
            timeLabel.centerXAnchor.constraint(equalTo: containerTimeView.centerXAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: containerTimeView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}