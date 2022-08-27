//
//  CalenderCollectionViewReusable.swift
//  Labor
//
//  Created by mehrnoush abdinian on 27.08.22.
//

import Foundation
import UIKit

class SectionHeader:UICollectionReusableView{
    
    let label = LabelBuilder()
        .setText("08:00 - 09:00", color: .black, fontSize: AppTheme.label.normalSize, fontWeight: .bold)
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentViewStyle()
        layout()
    }
         
    func contentViewStyle() {
//        contentView.backgroundColor = .white
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func layout() {
        addSubview(label)

        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
           // label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10).isActive = true
            label.heightAnchor.constraint(equalToConstant: 44),
           
        ])
    }
    
    
}

    





