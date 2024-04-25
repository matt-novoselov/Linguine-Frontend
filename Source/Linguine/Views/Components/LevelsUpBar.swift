//
//  LevelsUpBar.swift
//  Linguine (iOS)
//
//  Created by Matt Novoselov on 25/04/24.
//

import SwiftUI

struct LevelsUpBar: View {
    
    // Action that should be performed on log out
    var logOutAction: () -> Void
    
    // Current user score
    var currentScore: Int?
    
    var body: some View {

        HStack {
            // Italian flag
            Image(.italianFlag)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 30)

            
            Spacer()
            
            // User current score
            HStack(spacing: 6){
                LightningIcon()
                    .frame(width: 15,height: 18)
                    .foregroundColor(.lgBlueIcon)
                
                Text("\(currentScore == nil ? 0 : currentScore!) XP")
                    .font(Font.custom("DINNextRoundedLTPro-Bold", size: 18))
                    .foregroundColor(.lgBlueIcon)
                    .accessibilitySortPriority(0)
            }
            
            Spacer()
            
            // Log Out button
            Button(action: logOutAction){
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .font(.system(size: 18))
                    .fontWeight(.heavy)
                    .foregroundColor(.lgDropRedButton)
                    .accessibilityLabel("Logout")
                    .accessibilitySortPriority(0)
            }
        }
        
    }
}

#Preview {
    LevelsUpBar(logOutAction: {}, currentScore: 100)
}
