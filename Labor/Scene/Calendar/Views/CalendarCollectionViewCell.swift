//
//  CalendarCollectionViewCell.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//


import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    let containerTimeView = ViewBuilder()
        .setCornerRadius(AppTheme.cell.cornerRadius)
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellSelected(selected: false)
    }
    
    private func cellStyle()  {
        translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .clear
    }
    
    func setupCell(data: String){
            switch data {
            case "8":
                timeLabel.text = "08:00-09:00"
            case "9":
                timeLabel.text = "09:00-10:00"
            case "10":
                timeLabel.text = "10:00-11:00"
            case "11":
                timeLabel.text = "11:00-12:00"
            case "12":
                timeLabel.text = "12:00-13:00"
            case "13":
                timeLabel.text = "13:00-14:00"
            case "14":
                timeLabel.text = "14:00-15:00"
            case "15":
                timeLabel.text = "15:00-16:00"
            default:
                break
            }
        }
    
    func cellSelected(selected: Bool) {
        if selected {
            containerTimeView.backgroundColor = AppTheme.view.backGround_red_color
            timeLabel.textColor = .white
        } else {
            containerTimeView.backgroundColor = AppTheme.view.backGround_blue_color
            timeLabel.textColor = .black
        }
    }
    
    private func layout() {
        contentView.addSubview(containerTimeView)
        containerTimeView.addSubview(timeLabel)
        NSLayoutConstraint.activate([
            containerTimeView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerTimeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            containerTimeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerTimeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            timeLabel.centerXAnchor.constraint(equalTo: containerTimeView.centerXAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: containerTimeView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
