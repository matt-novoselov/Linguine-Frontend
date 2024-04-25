//
//  dropButtonRound.swift
//  Linguine (iOS)
//
//  Created by Matt Novoselov on 25/04/24.
//

import SwiftUI

// The structure for the circle (rounded) drop button
struct DropButtonRound: View {
    
    // The name of the SF symbol for the button
    var titleSymbol: String
    
    // Action that button should perform
    var action: () -> Void
    
    // Style for the button
    var style: Style
    
    // Compose style
    struct dropButtonStyle: ButtonStyle {
        
        var titleSymbol: String
        let buttonHeight: Double = 59
        let shadowHeight: Double = 7
        var style: Style
        
        func makeBody(configuration: Configuration) -> some View {
            ZStack(alignment: .top){
                // Compose bottom part of the button
                VStack{
                    Ellipse()
                        .frame(width: 71, height: buttonHeight)
                        .foregroundColor(style.color.dropColor)
                        .padding(.top, !configuration.isPressed ? shadowHeight : 0)
                    
                    Spacer()
                }
                
                // Compose bottom top of the button
                ZStack{
                    Ellipse()
                        .frame(width: 71, height: buttonHeight)
                        .foregroundColor(style.color.mainColor)
                    
                    Image(systemName: style == Style.completed ? "checkmark" : titleSymbol)
                        .font(.system(size: 26))
                        .foregroundColor(style.color.symbolColor)
                        .fontWeight(.black)
                }
            }
            .frame(height: buttonHeight+shadowHeight)
            .overlay(style == Style.standard ? ProgressBar() : nil, alignment: .center)
        }
    }
    
    
    var body: some View {
        Button(action: style != Style.disabled ? {action(); lightHaptic()}: {}){}
            .buttonStyle(
                dropButtonStyle(titleSymbol: titleSymbol, style: style)
            )
            .accessibilityLabel("Level")
    }
}


#Preview{
    DropButtonRound(titleSymbol: "xmark", action: {}, style: .standard)
}
