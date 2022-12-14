//
//  HapticGenerator.swift
//  Labor
//
//  Created by mehrnoush abdinian on 10.08.22.
//

import UIKit

enum HapticNotificationType {
    case error
    case success
    case warning
    case feedback(_ style: UIImpactFeedbackGenerator.FeedbackStyle)
}

protocol HUDFeedbackGenerator {
    func notification(_ notification: HapticNotificationType)
}

class HapticGenerator: HUDFeedbackGenerator {
    static let instance = HapticGenerator()
    let notificationGenerator = UINotificationFeedbackGenerator()
    var impactStyle: UIImpactFeedbackGenerator.FeedbackStyle = .light
    var impactGenerator = UIImpactFeedbackGenerator(style: .light)
    
    func notification(_ notification: HapticNotificationType) {
        switch notification {
        case .error: notificationGenerator.notificationOccurred(.error)
        case .success: notificationGenerator.notificationOccurred(.success)
        case .warning: notificationGenerator.notificationOccurred(.warning)
        case let .feedback(style): if impactStyle != style {
            impactGenerator = UIImpactFeedbackGenerator(style: style)
        }
            impactGenerator.impactOccurred()
        }
    }
}
