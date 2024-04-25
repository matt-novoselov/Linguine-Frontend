//
//  cardButton.swift
//  Linguine (iOS)
//
//  Created by Matt Novoselov on 25/04/24.
//

import SwiftUI

struct CardButton: View {
    
    // Title of the button
    var title: String
    
    // Name of the SVG icon
    var iconName: String?
    
    // Action that should be performed on button click
    var action: () -> Void
    
    // Style of the button
    var style: Style
    
    // Define a custom button style for the CardButton
    struct dropButtonStyle: ButtonStyle {
        
        // Title of the button
        var title: String
        
        // Name of the SVG icon
        var iconName: String?
        
        // Calculate the height of the button based on whether an icon is provided
        var buttonHeight: Double {
            return iconName != nil ? 260 : 45
        }
        
        // Height of the shadow
        let shadowHeight: Double = 4
        
        var style: Style
        
        // Define the appearance and behavior of the button
        func makeBody(configuration: Configuration) -> some View {
            ZStack(alignment: .top) {
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: buttonHeight)
                        .foregroundColor(style.color.dropColor)
                        // Add shadow when the button is not pressed
                        .padding(.top, !configuration.isPressed ? shadowHeight : 0)
                    
                    Spacer()
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: buttonHeight)
                        .foregroundColor(style != Style.disabled ? .lgSelectedCardButton : .lgBackground)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style.color.mainColor, lineWidth: 2)
                        .frame(height: buttonHeight)
                    
                    VStack {
                        if let unwrappedIconName = iconName {
                            Spacer()
                            // Display an icon if provided
                            UILottieView(lottieName: unwrappedIconName, playOnce: true)
                                .frame(height: 100)
                            Spacer()
                        }
                        
                        // Display the title of the button
                        Text(title)
                            .textCase(.lowercase)
                            .font(Font.custom("DINNextRoundedLTPro-Regular", size: 20))
                            .foregroundColor(.white)
                            .padding(.bottom, iconName != nil ? 10 : 0)
                    }
                    .frame(maxHeight: buttonHeight)
                }
            }
            // Adjust the overall frame height to accommodate the shadow
            .frame(height: buttonHeight + shadowHeight)
        }
    }
    
    var body: some View {
        // Create a button using the custom button style
        Button(action: action) {}
            .buttonStyle(
                dropButtonStyle(title: title, iconName: iconName, style: style)
            )
    }
}

#Preview{
    CardButton(title: "Test", action: {}, style: .standard)
}
