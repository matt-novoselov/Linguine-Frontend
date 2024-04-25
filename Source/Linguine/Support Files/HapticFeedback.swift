//
//
//
//
//
//

import SwiftUI
import CoreHaptics

// Function to perform light haptic feedback
// This type of feedback is used for negative actions
func lightHaptic() {
    let lightHaptic = UIImpactFeedbackGenerator(style: .light)
    lightHaptic.impactOccurred()
}

// Function to perform light heavy feedback
// This type of feedback is used for positive actions
func heavy() {
    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
    impactHeavy.impactOccurred()
}
