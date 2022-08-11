//
//  RegisterView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//

import UIKit

class RegisterView: UIView {
    
    let fixedBottomView = ViewBuilder()
        .setBackground(.white)
        .setCornerRadius(AppTheme.fixedBottomView_corner, onlyTop: true, onlyBottom: false)
        .build()
    
    let nameTextField = TextFieldBuilder()
        .mainSetting(keyboardType: .default, radius: AppTheme.main_textField.cornerRadius, placeholder: "benutzername", textAlignment: .left, backGroundColor: .white)
        .sideIcon(UIImage(systemName: "person")!, width: 24, height: 24, padding: 14)
        .setBorderDeselected()
        .build()

    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }

    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = AppTheme.backGround_color
    }
    
    func layout() {
        addSubview(fixedBottomView)
        fixedBottomView.addSubview(nameTextField)
        NSLayoutConstraint.activate([
            fixedBottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            fixedBottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fixedBottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            fixedBottomView.heightAnchor.constraint(equalToConstant: 200),
            
            nameTextField.topAnchor.constraint(equalTo: fixedBottomView.centerYAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 52),
            nameTextField.leadingAnchor.constraint(equalTo: fixedBottomView.leadingAnchor, constant: 10),
            nameTextField.trailingAnchor.constraint(equalTo: fixedBottomView.trailingAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
