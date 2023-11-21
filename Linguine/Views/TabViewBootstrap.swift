import SwiftUI

struct TabViewBootstrap: View {
    var selectedUser: User
    var currentScore: Int
    @Binding var user: User?
    
    var body: some View {
        TabView {
            MenuView(user: $user, selectedUser: selectedUser, currentScore: currentScore)
                .tabItem {
                    Label("", systemImage: "house.fill")
                }
            LeaderboardView(selectedUser: selectedUser)
                .tabItem {
                    Label("", systemImage: "trophy.fill")
                }
        }
    }
}

#Preview {
    TabViewBootstrap(
        selectedUser:
            User(
            id: "auth1|6552867564e79113efcb65f7",
            email: "example@gmail.com", nickname: "example"),
        currentScore: 0,
        user: Bootstrap().$user
    )
}
