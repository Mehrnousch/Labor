//
//  LoginView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//


import UIKit

class LoginView: UIView {
    
    let fixedBottomView = ViewBuilder()
        .setBackground(.white)
        .setCornerRadius(AppTheme.fixedBottomView_corner, onlyTop: true, onlyBottom: false)
        .build()
    
    let fixedBottomViewHeader = LabelBuilder()
        .setText("Anmelden", color: .black, fontSize: 20, fontWeight: .bold)
        .build()
    
    let emailTextField = TextFieldBuilder()
        .mainSetting(keyboardType: .default, radius: AppTheme.main_textField_button.cornerRadius, placeholder: "E-Mail Addresse", textAlignment: .left, backGroundColor: .white)
        .sideIcon(UIImage(systemName: "envelope")!, width: 24, height: 24, padding: 14)
        .setBorderDeselected()
        .build()
    
    let passwordTextField = TextFieldBuilder()
        .mainSetting(keyboardType: .default, radius: AppTheme.main_textField_button.cornerRadius, placeholder: "Passwort", textAlignment: .left, backGroundColor: .white)
        .sideIcon(UIImage(systemName: "lock")!, width: 24, height: 24, padding: 14)
        .setBorderDeselected()
        .build()
    
    let loginButton = ButtonBuilder()
        .setTitle("Anmelden", color: .white)
        .setBackground(AppTheme.backGround_color)
        .setCornerRadius(AppTheme.main_textField_button.cornerRadius)
        .build()
    
    let registerButton = ButtonBuilder()
        .setTitle("Ein Konto erstellen", color: .white)
        .setBackground(AppTheme.gray_color)
        .setCornerRadius(AppTheme.main_textField_button.cornerRadius)
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
        fixedBottomView.addSubview(fixedBottomViewHeader)
        fixedBottomView.addSubview(emailTextField)
        fixedBottomView.addSubview(passwordTextField)
        fixedBottomView.addSubview(loginButton)
        fixedBottomView.addSubview(registerButton)
        NSLayoutConstraint.activate([
            fixedBottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            fixedBottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fixedBottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            fixedBottomViewHeader.centerXAnchor.constraint(equalTo: fixedBottomView.centerXAnchor),
            fixedBottomViewHeader.topAnchor.constraint(equalTo: fixedBottomView.topAnchor, constant: 30),
            
            emailTextField.topAnchor.constraint(equalTo: fixedBottomViewHeader.bottomAnchor, constant: 80),
            emailTextField.heightAnchor.constraint(equalToConstant: AppTheme.main_textField_button.height),
            emailTextField.leadingAnchor.constraint(equalTo: fixedBottomView.leadingAnchor, constant: 10),
            emailTextField.trailingAnchor.constraint(equalTo: fixedBottomView.trailingAnchor, constant: -10),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordTextField.heightAnchor.constraint(equalToConstant: AppTheme.main_textField_button.height),
            passwordTextField.leadingAnchor.constraint(equalTo: fixedBottomView.leadingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: fixedBottomView.trailingAnchor, constant: -10),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.heightAnchor.constraint(equalToConstant: AppTheme.main_textField_button.height),
            loginButton.leadingAnchor.constraint(equalTo: fixedBottomView.leadingAnchor, constant: 10),
            loginButton.trailingAnchor.constraint(equalTo: fixedBottomView.trailingAnchor, constant: -10),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            registerButton.bottomAnchor.constraint(equalTo: fixedBottomView.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            registerButton.heightAnchor.constraint(equalToConstant: AppTheme.main_textField_button.height),
            registerButton.leadingAnchor.constraint(equalTo: fixedBottomView.leadingAnchor, constant: 10),
            registerButton.trailingAnchor.constraint(equalTo: fixedBottomView.trailingAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
