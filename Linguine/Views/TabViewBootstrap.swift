import SwiftUI

struct TabViewBootstrap: View {
    var selected_user: User
    var current_score: Int
    @Binding var user: User?
    
    var body: some View {
        TabView {
            LevelsSelectionView(user: $user, selected_user: selected_user, current_score: current_score)
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

#Preview {
    TabViewBootstrap(
        selected_user:
            User(
            id: "auth1|6552867564e79113efcb65f7",
            email: "example@gmail.com", nickname: "example"),
        current_score: 0,
        user: Bootstrap().$user
    )
}
