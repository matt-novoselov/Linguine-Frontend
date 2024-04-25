//
//  DropButtonStyles.swift
//  Linguine (iOS)
//
//  Created by Matt Novoselov on 25/04/24.
//

import SwiftUI

// Define all properties for the custom style
struct dropButtonCustomStyle {
    
    // The main background color of the button
    var mainColor: Color
    
    // The color of the drop shadow of the button
    var dropColor: Color
    
    // The color of the text on the button
    var textColor: Color
    
    // The color of the symbol on the button
    var symbolColor: Color
}

enum Style: String, CaseIterable {
    
    case standard // Standard pink button
    case mistake // Red version of the button, used to indicate mistakes
    case correct // Green version of the button, used to indicate correct answers
    case disabled // Disabled version of the button
    case completed // Version of the button that is used when the level is completed
    
    var color: dropButtonCustomStyle {
        switch self {
        case .standard, .completed: return dropButtonCustomStyle(mainColor: .lgPinkButton, dropColor: .lgDropPinkButton, textColor: .lgBackground, symbolColor: .white)
        case .mistake: return dropButtonCustomStyle(mainColor: .lgRedButton, dropColor: .lgDropRedButton, textColor: .lgBackground, symbolColor: .lgBackground)
        case .correct: return dropButtonCustomStyle(mainColor: .lgGreenButton, dropColor: .lgDropGreenButton, textColor: .lgBackground, symbolColor: .lgBackground)
        case .disabled: return dropButtonCustomStyle(mainColor: .lgDisabledButton, dropColor: .lgDropDisabledButton, textColor: .lgDisabledTitle, symbolColor: .lgDisabledTitle)
        }
    }
}
