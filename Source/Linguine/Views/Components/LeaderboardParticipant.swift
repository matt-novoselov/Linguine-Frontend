//
//  leaderboardParticipant.swift
//  Linguine (iOS)
//
//  Created by Matt Novoselov on 25/04/24.
//

import SwiftUI

// Leaderboard participant is a single row in a leaderboard
struct LeaderboardParticipant: View {
    
    // The nickname of the user
    var nickname: String = "example"
    
    // A score amount of the user
    var scoreAmount: Int = 0
    
    // User's place in the leaderboard
    var place: Int = 0
    
    // If the logged in user is the user displayed in the leaderboard, then he is highlighted
    var isHighlighted: Bool = false
    
    var body: some View {
        ZStack{
            Rectangle()
                .padding(.horizontal, -50)
                .ignoresSafeArea()
                .frame(height: 65)
                .foregroundColor(.lgLeaderboardHighlight)
                .opacity(isHighlighted ? 1 : 0)
            
            HStack(spacing: 10){
                Text("\(place)")
                    .font(Font.custom("DINNextRoundedLTPro-Bold", size: 16))
                    .frame(width: 18, alignment: .leading)
                
                ZStack{
                    Circle()
                        .frame(height: 45)
                    
                    Text(nickname.prefix(1))
                        .textCase(.uppercase)
                        .font(Font.custom("DINNextRoundedLTPro-Bold", size: 24))
                        .foregroundColor(.lgBackground)
                        .padding(.top, 4.5)
                }
                .padding(.trailing, 5)
                
                Text("@\(nickname)")
                    .font(Font.custom("DINNextRoundedLTPro-Bold", size: 18))
                
                Spacer()
                
                Text("\(scoreAmount) XP")
                    .font(Font.custom("DINNextRoundedLTPro-regular", size: 18))
                    .frame(alignment: .trailing)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Place \(place) - \(nickname). \(scoreAmount) XP")
    }
}

#Preview {
    LeaderboardParticipant(nickname: "Test", scoreAmount: 100, place: 0, isHighlighted: true)
}
