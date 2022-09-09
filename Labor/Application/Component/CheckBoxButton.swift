//
//  CheckBoxButton.swift
//  Labor
//
//  Created by mehrnoush abdinian on 02.09.22.
//

import UIKit

class CheckBoxButton: UIButton {
    
    let icon = ImageBuilder()
        .setImage("uncheck")
        .build()
    
    let label = LabelBuilder()
        .setText("", color: .black, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    var isItClicked = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        icon.isUserInteractionEnabled = false
        layout()
    }
    
    func setLabel(label: String) {
        self.label.text = label
    }
    
    func setIconSelectButton() {
        self.isItClicked = !isItClicked
        if isItClicked {
            icon.image = UIImage(named: "check")
        } else {
            icon.image = UIImage(named: "uncheck")
        }
    }
    
    func layout() {
        addSubview(icon)
        addSubview(label)
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            icon.heightAnchor.constraint(equalToConstant: 30),
            icon.widthAnchor.constraint(equalToConstant: 30),
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            label.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
