//
//  DropButton.swift
//  Linguine (iOS)
//
//  Created by Matt Novoselov on 25/04/24.
//

import SwiftUI

// The structure for the drop button
struct DropButton: View {
    
    // Title of the button
    var title: String
    
    // Action that button should perform
    var action: () -> Void
    
    // Style for the button
    var style: Style
    
    // Compose style
    struct dropButtonStyle: ButtonStyle {
        
        var title: String
        let buttonHeight: Double = 45
        let shadowHeight: Double = 4
        var style: Style
        
        func makeBody(configuration: Configuration) -> some View {
            ZStack(alignment: .top){
                // Compose bottom part of the button
                VStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: buttonHeight)
                        .foregroundColor(style.color.dropColor)
                        .padding(.top, !configuration.isPressed ? shadowHeight : 0)
                    
                    Spacer()
                }
                
                // Compose bottom top of the button
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: buttonHeight)
                        .foregroundColor(style.color.mainColor)
                    
                    Text(title)
                        .textCase(.uppercase)
                        .font(Font.custom("DINNextRoundedLTPro-Bold", size: 16))
                        .foregroundColor(style.color.textColor)
                }
            }
            .frame(height: buttonHeight+shadowHeight)
        }
    }
    
    var body: some View {
        Button(action: style != Style.disabled ? action : {}){}
            .buttonStyle(
                dropButtonStyle(title: title, style: style)
            )
            .accessibilityHidden(style == Style.disabled)
    }
}

#Preview{
    DropButton(title: "Test", action: {}, style: .mistake)
}
