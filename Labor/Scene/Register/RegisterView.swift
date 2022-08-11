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
        .setCornerRadius(AppTheme.view.fixedBottomView_corner, onlyTop: true, onlyBottom: false)
        .build()
    
    let fixedBottomViewHeader = LabelBuilder()
        .setText("Konto erstellen", color: .black, fontSize: 20, fontWeight: .bold)
        .build()
    
    let nameTextField = TextFieldBuilder()
        .mainSetting(keyboardType: .default, radius: AppTheme.textField.cornerRadius, placeholder: "Benutzername", textAlignment: .left, backGroundColor: .white)
        .sideIcon(UIImage(systemName: "person")!, width: 24, height: 24, padding: 14)
        .setBorderDeselected()
        .build()
    
    let emailTextField = TextFieldBuilder()
        .mainSetting(keyboardType: .default, radius: AppTheme.textField.cornerRadius, placeholder: "E-Mail Addresse", textAlignment: .left, backGroundColor: .white)
        .sideIcon(UIImage(systemName: "envelope")!, width: 24, height: 24, padding: 14)
        .setBorderDeselected()
        .build()
    
    let passwordTextField = TextFieldBuilder()
        .mainSetting(keyboardType: .default, radius: AppTheme.textField.cornerRadius, placeholder: "Passwort", textAlignment: .left, backGroundColor: .white)
        .sideIcon(UIImage(systemName: "lock")!, width: 24, height: 24, padding: 14)
        .setBorderDeselected()
        .build()
    
    let registerButton = ButtonBuilder()
        .setTitle("Registrieren", color: .white)
        .setBackground(AppTheme.button.backGround_color)
        .setCornerRadius(AppTheme.button.cornerRadius)
        .build()

    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        actionButton()
        layout()
    }

    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
    }
    
    func actionButton() {
        
    }
    
    func layout() {
        addSubview(fixedBottomView)
        fixedBottomView.addSubview(fixedBottomViewHeader)
        fixedBottomView.addSubview(nameTextField)
        fixedBottomView.addSubview(emailTextField)
        fixedBottomView.addSubview(passwordTextField)
        fixedBottomView.addSubview(registerButton)
        NSLayoutConstraint.activate([
            fixedBottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            fixedBottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fixedBottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            fixedBottomViewHeader.centerXAnchor.constraint(equalTo: fixedBottomView.centerXAnchor),
            fixedBottomViewHeader.topAnchor.constraint(equalTo: fixedBottomView.topAnchor, constant: 30),
            
            nameTextField.topAnchor.constraint(equalTo: fixedBottomViewHeader.bottomAnchor, constant: 80),
            nameTextField.heightAnchor.constraint(equalToConstant: AppTheme.textField.height),
            nameTextField.leadingAnchor.constraint(equalTo: fixedBottomView.leadingAnchor, constant: 10),
            nameTextField.trailingAnchor.constraint(equalTo: fixedBottomView.trailingAnchor, constant: -10),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30),
            emailTextField.heightAnchor.constraint(equalToConstant: AppTheme.textField.height),
            emailTextField.leadingAnchor.constraint(equalTo: fixedBottomView.leadingAnchor, constant: 10),
            emailTextField.trailingAnchor.constraint(equalTo: fixedBottomView.trailingAnchor, constant: -10),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordTextField.heightAnchor.constraint(equalToConstant: AppTheme.textField.height),
            passwordTextField.leadingAnchor.constraint(equalTo: fixedBottomView.leadingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: fixedBottomView.trailingAnchor, constant: -10),
            
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            registerButton.bottomAnchor.constraint(equalTo: fixedBottomView.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            registerButton.heightAnchor.constraint(equalToConstant: AppTheme.button.height),
            registerButton.leadingAnchor.constraint(equalTo: fixedBottomView.leadingAnchor, constant: 10),
            registerButton.trailingAnchor.constraint(equalTo: fixedBottomView.trailingAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
