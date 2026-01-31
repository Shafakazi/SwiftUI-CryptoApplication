//
//  HapticManager.swift
//  SwiftFulCrypto
//
//  Created by Shafakhat on 31/01/26.
//

import Foundation
import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
