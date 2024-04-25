//
//  TextFieldStyle.swift
//  Linguine (iOS)
//
//  Created by Matt Novoselov on 25/04/24.
//

import SwiftUI

// Custom style for the Input Text Field
struct WhiteBorder: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(Font.custom("DINNextRoundedLTPro-Regular", size: 18))
            .foregroundColor(.white)
            .padding()
            .background(.lgLeaderboardHighlight)
            .cornerRadius(10)
            .overlay{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.lgDisabledButton, lineWidth:2)
            }
    }
}
