//
//  SummaryBox.swift
//  Linguine (iOS)
//
//  Created by Matt Novoselov on 25/04/24.
//

import SwiftUI

// Summary box is displayed in the end of the lesson and contains information about how good the user performed
struct SummaryBox: View {
    
    // An amount XP earned by user through the last lesson
    var earnedXP: Int = 0
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 17)
            .frame(height: 85)
            .foregroundColor(.lgPinkButton)
            .overlay{
                VStack{
                    Text("Total xp")
                        .textCase(.uppercase)
                        .font(Font.custom("DINNextRoundedLTPro-Bold", size: 14))
                        .foregroundColor(.lgBackground)
                        .padding(.top, 5)
                    
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.lgBackground)
                        .overlay{
                            HStack{
                                LightningIcon()
                                    .frame(width: 15,height: 18)
                                    .foregroundColor(.lgPinkButton)
                                
                                Text("\(earnedXP)")
                                    .textCase(.uppercase)
                                    .font(Font.custom("DINNextRoundedLTPro-Bold", size: 20))
                                    .foregroundColor(.lgPinkButton)
                            }
                        }
                }
                .padding(.all, 2)
            }
        
    }
}

#Preview {
    SummaryBox()
}
