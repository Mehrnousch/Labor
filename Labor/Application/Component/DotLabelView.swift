//
//  DotLab.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//


import UIKit

class DotLabelView: UIView {
    
    let point = ImageBuilder()
        .setImage(.init(systemName: "point") ?? UIImage(named: "dot")!)
        .build()
    
    let label = LabelBuilder()
        .setText()
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    func setData(label: String) {
        self.label.text = label
    }
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
    }

    func layout() {
        addSubview(point)
        addSubview(label)
        NSLayoutConstraint.activate([
            point.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            point.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            point.heightAnchor.constraint(equalToConstant: 10),
            point.widthAnchor.constraint(equalToConstant: 10),

            label.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            label.leadingAnchor.constraint(equalTo: point.trailingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
