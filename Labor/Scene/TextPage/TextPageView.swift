//
//  TextPageViewModel.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import UIKit

class TextPageView: UIView {
    
    let textBox = UITextView()
    
    let placeHolderLabel = LabelBuilder()
        .setText("Input description...", color: .lightGray, fontSize: AppTheme.label.normalSize, fontWeight: .regular)
        .build()
    
    let saveButton = ButtonBuilder()
        .setBackground(AppTheme.view.backGround_red_color)
        .setCornerRadius(AppTheme.view.cornerRadius)
        .setTitle("Save information", color: .white)
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        styleTextBox()
        layout()
    }
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
    }
    
    func styleTextBox() {
        textBox.translatesAutoresizingMaskIntoConstraints = false
        textBox.delegate = self
        textBox.autocorrectionType = .no
        textBox.backgroundColor = .clear
        textBox.font = UIFont.appPrimaryFontWith(size: AppTheme.label.normalSize, weight: .regular)
        textBox.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textBox.layer.masksToBounds = false
    }
 
    func layout() {
        addSubview(textBox)
        textBox.addSubview(placeHolderLabel)
        addSubview(saveButton)
        NSLayoutConstraint.activate([
            textBox.topAnchor.constraint(equalTo: topAnchor, constant: AppTheme.view.paddingTop),
            textBox.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: AppTheme.view.paddingBottom),
            textBox.trailingAnchor.constraint(equalTo: trailingAnchor, constant: AppTheme.view.paddingRight),
            textBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppTheme.view.paddingLeft),

            placeHolderLabel.topAnchor.constraint(equalTo: textBox.topAnchor, constant: AppTheme.label.normalSize / 2),
            placeHolderLabel.leadingAnchor.constraint(equalTo: textBox.leadingAnchor, constant: 20),
            
            saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: AppTheme.view.paddingBottom),
            saveButton.heightAnchor.constraint(equalToConstant: AppTheme.button.height),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: AppTheme.view.paddingRight),
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppTheme.view.paddingLeft),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - UITextViewDelegate
extension TextPageView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        placeHolderLabel.isHidden = !textView.text.isEmpty
    }
}
