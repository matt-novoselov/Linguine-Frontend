import SwiftUI
import CoreHaptics

func lightHaptic() {
    let lightHaptic = UIImpactFeedbackGenerator(style: .light)
    lightHaptic.impactOccurred()
}

func haevyHaptic() {
    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
    impactHeavy.impactOccurred()
}
