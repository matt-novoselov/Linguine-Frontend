import SwiftUI

struct TabViewBootstrap: View {
    var selected_user: User
    var current_score: Int
    @Binding var user: User?
    
    var body: some View {
        TabView {
            LevelsSelectionView(user: $user, current_score: current_score, selected_user: selected_user)
                .tabItem {
                    Label("", systemImage: "house.fill")
                }
            LeaderboardView(selected_user: selected_user)
                .tabItem {
                    Label("", systemImage: "trophy.fill")
                }
        }
    }
}
