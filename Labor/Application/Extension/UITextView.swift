//
//  UITextView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 07.08.22.
//

import UIKit

extension UITextView {
    
    func hyperLink(originalText: String, hyperLink: String, urlString: String) {
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        let attributedOriginalText = NSMutableAttributedString(string: originalText)
        let linkRange = attributedOriginalText.mutableString.range(of: hyperLink)
        let fullRange = NSMakeRange(0, attributedOriginalText.length)
        attributedOriginalText.addAttribute(.link, value: urlString, range: linkRange)
        attributedOriginalText.addAttribute(.paragraphStyle, value: style, range: fullRange)
        attributedOriginalText.addAttribute(.font, value: UIFont.appPrimaryFontWith(size: 10, weight: .regular), range: fullRange)
        self.linkTextAttributes = [
            .foregroundColor: AppTheme.label.link_text_color,
            .underlineStyle: NSUnderlineStyle.single.rawValue,
        ]
        self.attributedText = attributedOriginalText
    }
}
