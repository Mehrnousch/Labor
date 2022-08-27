//
//  CalendarCollectionViewCell.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//


import Foundation
import UIKit

class CalendarCollectionViewCell: UICollectionViewListCell {
    
    let container = ViewBuilder()
        .setCornerRadius(AppTheme.cell.corner)
        .setBackground(AppTheme.cell.light_gray_color)
        .build()

    
    
    let label = LabelBuilder()
        .setText("09.10.2022", color: .black, fontSize: AppTheme.label.normalSize, fontWeight: .bold)
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentViewStyle()
        layout()
    }
    
    
    
    func contentViewStyle() {
        contentView.backgroundColor = .white
    }
    
    func setData() {
        
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        contentView.addSubview(container)
        container.addSubview(label)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            
            label.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -5),
            label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 5),
            label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -5),
           
        ])
    }
    
    
}

// MARK: - data setup cell
extension CalendarCollectionViewCell {
    
    func setupCell(data: String){
        label.text = data
       
   }
    
}


