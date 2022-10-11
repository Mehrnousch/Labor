//
//  SeactionHeader.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import Foundation
import UIKit

class SectionHeader: UICollectionReusableView {
    
    let label = LabelBuilder()
        .setText("", color: .label, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .setBackground(.secondarySystemBackground)
        .setCornerRadius(AppTheme.view.cornerRadius)
        .setAlignment(.center)
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    func setupCell(data: String){
        label.text = data
    }
    
    func layout() {
        addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppTheme.cell.paddingLeft),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: AppTheme.cell.paddingRight),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
