//
//  ExtendedDivider.swift
//  Linguine (iOS)
//
//  Created by Matt Novoselov on 25/04/24.
//

import SwiftUI

// Custom style divider that is mainly used in leaderboard
struct ExtendedDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 3)
            .foregroundColor(.lgLeaderboardHighlight)
            .padding(.horizontal, -50)
    }
}

#Preview {
    ExtendedDivider()
}
