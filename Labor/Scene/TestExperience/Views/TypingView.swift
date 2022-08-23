//
//  TypingView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 23.08.22.
//

import UIKit

class TypingView: UIView {
    
    let descriptionLabel = LabelBuilder()
        .setText("Description of the test experience", color: UIColor.darkGray, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    let textViewMessage = TextViewBuilder()
        .setText("", color: UIColor(named: "black") ?? .black, fontSize: 16, fontWeight: .regular)
        .build()
    
    var didChangeSize: ()-> Void = {}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = AppTheme.view.backGround_light_gray_color
        
        textViewMessage.layer.cornerRadius = AppTheme.view.cornerRadius
        textViewMessage.isEditable = true
        textViewMessage.isScrollEnabled = true
        
        textViewMessage.delegate = self
        textViewMessage.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)

        textViewMessage.text = AppTheme.label.placeHolder_textView
        textViewMessage.textColor = UIColor.lightGray
        textViewMessage.becomeFirstResponder()
        textViewMessage.selectedTextRange = textViewMessage.textRange(from: textViewMessage.beginningOfDocument, to: textViewMessage.beginningOfDocument)
    }
    
    func layout() {
        addSubview(descriptionLabel)
        addSubview(textViewMessage)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            textViewMessage.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            textViewMessage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            textViewMessage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            textViewMessage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            textViewMessage.heightAnchor.constraint(equalToConstant: 68),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Extension

extension TypingView: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
        let size = CGSize(width: superview!.bounds.width * 0.65, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        guard textView.contentSize.height < 300.0 else { textView.isScrollEnabled = true; return }
        textView.isScrollEnabled = false
        textView.constraints.forEach { (constraint) in
            let minHeight: CGFloat = 68
            if constraint.firstAttribute == .height {
                let newHeight = estimatedSize.height < minHeight ? minHeight : estimatedSize.height + 4
                if constraint.constant != newHeight {
                    didChangeSize()
                }
                constraint.constant = newHeight
            }
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let currentText:String = textView.text
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)
        
        if updatedText.isEmpty {
            
            textView.text = AppTheme.label.placeHolder_textView
            textView.textColor = UIColor.lightGray
            
            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
        }else if textView.textColor == UIColor.lightGray && !text.isEmpty {
            textView.textColor = UIColor.black
            textView.text = text
        }else {
            return textView.text.count + (text.count - range.length) <= 500
        }
        return false
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        if self.window != nil {
            if textView.textColor == UIColor.lightGray {
                textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
            }
        }
    }
}
