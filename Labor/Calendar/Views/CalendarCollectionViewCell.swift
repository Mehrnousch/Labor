//
//  CalendarCollectionViewCell.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//


import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    
    
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
        
        NSLayoutConstraint.activate([
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
