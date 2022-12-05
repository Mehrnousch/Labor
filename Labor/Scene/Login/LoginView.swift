//
//  LoginView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//

import UIKit

class LoginView: UIView {
    
    let fixedTopView = ViewBuilder()
        .setBackground(AppTheme.view.backGround_red_color)
        .build()
    
    let logoImage = ImageBuilder()
        .setImage("Logo-TU")
        .build()

    let logoTopLabel = LabelBuilder()
        .setText("Institut für Werkstoffwissenschaften und -technologien", color: .white, fontSize: AppTheme.label.minimumSize, fontWeight: .bold)
        .build()
    
    let logoBottomLabel = LabelBuilder()
        .setText("Werkstofftechnik", color: .white, fontSize: AppTheme.label.normalSize, fontWeight: .bold)
        .build()
    
    let fixedBottomView = ViewBuilder()
        .setBackground(.white)
        .setCornerRadius(AppTheme.view.fixedBottomView_corner, onlyTop: true, onlyBottom: false)
        .build()
    
    let fixedBottomViewHeader = LabelBuilder()
        .setText("Anmelden", color: .black, fontSize: AppTheme.label.maximumSize, fontWeight: .bold)
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
        .setSecureTextEntry()
        .build()

    
    let loginButton = ButtonBuilder()
        .setTitle("Anmelden", color: .white)
        .setBackground(AppTheme.button.backGround_color)
        .setCornerRadius(AppTheme.button.cornerRadius)
        .build()
    
    let registerButton = ButtonBuilder()
        .setTitle("Konto erstellen", color: .white)
        .setBackground(AppTheme.button.dark_gray_color)
        .setCornerRadius(AppTheme.button.cornerRadius)
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }

    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = AppTheme.view.backGround_red_color
    }
    
    func layout() {
        addSubview(fixedTopView)
        fixedTopView.addSubview(logoImage)
        fixedTopView.addSubview(logoTopLabel)
        fixedTopView.addSubview(logoBottomLabel)
        addSubview(fixedBottomView)
        fixedBottomView.addSubview(fixedBottomViewHeader)
        fixedBottomView.addSubview(emailTextField)
        fixedBottomView.addSubview(passwordTextField)
//        passwordTextField.addSubview(hiddenButton)
        fixedBottomView.addSubview(loginButton)
        fixedBottomView.addSubview(registerButton)
        NSLayoutConstraint.activate([
            fixedTopView.topAnchor.constraint(equalTo: topAnchor),
            fixedTopView.bottomAnchor.constraint(equalTo: fixedBottomView.topAnchor),
            fixedTopView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fixedTopView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            logoImage.centerXAnchor.constraint(equalTo: fixedTopView.centerXAnchor),
            logoImage.bottomAnchor.constraint(equalTo: logoTopLabel.topAnchor, constant: -10),
            logoImage.heightAnchor.constraint(equalToConstant: 148),
            logoImage.widthAnchor.constraint(equalToConstant: 199),
            
            logoTopLabel.bottomAnchor.constraint(equalTo: logoBottomLabel.topAnchor, constant: -10),
            logoTopLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            logoBottomLabel.bottomAnchor.constraint(equalTo: fixedBottomView.topAnchor, constant: -20),
            logoBottomLabel.centerXAnchor.constraint(equalTo: fixedTopView.centerXAnchor),
           
            fixedBottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            fixedBottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fixedBottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            fixedBottomViewHeader.centerXAnchor.constraint(equalTo: fixedBottomView.centerXAnchor),
            fixedBottomViewHeader.topAnchor.constraint(equalTo: fixedBottomView.topAnchor, constant: 30),
            
            emailTextField.topAnchor.constraint(equalTo: fixedBottomViewHeader.bottomAnchor, constant: 50),
            emailTextField.heightAnchor.constraint(equalToConstant: AppTheme.textField.height),
            emailTextField.leadingAnchor.constraint(equalTo: fixedBottomView.leadingAnchor, constant: AppTheme.view.paddingLeft),
            emailTextField.trailingAnchor.constraint(equalTo: fixedBottomView.trailingAnchor, constant: AppTheme.view.paddingRight),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordTextField.heightAnchor.constraint(equalToConstant: AppTheme.textField.height),
            passwordTextField.leadingAnchor.constraint(equalTo: fixedBottomView.leadingAnchor, constant: AppTheme.view.paddingLeft),
            passwordTextField.trailingAnchor.constraint(equalTo: fixedBottomView.trailingAnchor, constant: AppTheme.view.paddingRight),
//            hiddenButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
//            hiddenButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -10),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.heightAnchor.constraint(equalToConstant: AppTheme.button.height),
            loginButton.leadingAnchor.constraint(equalTo: fixedBottomView.leadingAnchor, constant: AppTheme.view.paddingLeft),
            loginButton.trailingAnchor.constraint(equalTo: fixedBottomView.trailingAnchor, constant: AppTheme.view.paddingRight),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: AppTheme.view.paddingTop),
            registerButton.bottomAnchor.constraint(equalTo: fixedBottomView.safeAreaLayoutGuide.bottomAnchor, constant: AppTheme.view.paddingBottom),
            registerButton.heightAnchor.constraint(equalToConstant: AppTheme.button.height),
            registerButton.leadingAnchor.constraint(equalTo: fixedBottomView.leadingAnchor, constant: AppTheme.view.paddingLeft),
            registerButton.trailingAnchor.constraint(equalTo: fixedBottomView.trailingAnchor, constant: AppTheme.view.paddingRight),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
