//
//  AddDescriptionView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 13.08.22.
//


import UIKit

class DescriptionView: UIView {
    
    let textView = ViewBuilder()
        .setBackground(AppTheme.cell.light_gray_color)
        .setCornerRadius(10)
        .build()
    
    
    let text = LabelBuilder()
        .setText("1111111 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries1111111 Lorem Ipsum is simply dummy text of the printing and typesetting industry. ", color: .black, fontSize: AppTheme.label.normalSize, fontWeight: .regular)
        .build()
    
    
    
    
    let leftImageView = ViewBuilder()
        .setBackground(AppTheme.cell.light_gray_color)
        .setCornerRadius(10)
        .build()
    
    let leftImage = ImageBuilder()
        .setImage("1")
        .setCornerRadius(10)
        .build()

    let rightImageView = ViewBuilder()
        .setBackground(AppTheme.cell.light_gray_color)
        .setCornerRadius(10)
        .build()
    
    let rightImage = ImageBuilder()
        .setImage("1")
        .setCornerRadius(10)
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }

    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
       
    }
    
    func layout() {
        addSubview(textView)
        textView.addSubview(text)
        addSubview(leftImageView)
        leftImageView.addSubview(leftImage)
        addSubview(rightImageView)
        rightImageView.addSubview(rightImage)

        NSLayoutConstraint.activate([
            
            textView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor , constant: 20)  ,
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textView.heightAnchor.constraint(equalToConstant: 300),
            
            
            text.topAnchor.constraint(equalTo: textView.topAnchor, constant: 20),
            text.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 20),
            text.trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: -20),
            
           
            leftImageView.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20),
            leftImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            leftImageView.heightAnchor.constraint(equalToConstant: 150),
            leftImageView.widthAnchor.constraint(equalToConstant: 150),

            
            leftImage.topAnchor.constraint(equalTo: leftImageView.topAnchor, constant: 20),
            leftImage.leadingAnchor.constraint(equalTo: leftImageView.leadingAnchor, constant: 20),
            leftImage.centerXAnchor.constraint(equalTo: leftImageView.centerXAnchor),
            leftImage.centerYAnchor.constraint(equalTo: leftImageView.centerYAnchor),

            
            rightImageView.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20),
            rightImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            rightImageView.heightAnchor.constraint(equalToConstant: 150),
            rightImageView.widthAnchor.constraint(equalToConstant: 150),
            
            
            rightImage.topAnchor.constraint(equalTo: rightImageView.topAnchor, constant: 20),
            rightImage.leadingAnchor.constraint(equalTo: rightImageView.leadingAnchor, constant: 20),
            rightImage.centerXAnchor.constraint(equalTo: rightImageView.centerXAnchor),
            rightImage.centerYAnchor.constraint(equalTo: rightImageView.centerYAnchor)



            
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
