import SwiftUI
import Auth0

struct SwiftUIView: View {
    @State var user: User?
    @State private var loadingFinished: Bool = false
    @State var currentScore: Int?
    @State var listOfUsers: [UUIDSingleUser]?
    var selectedUser: User

    init(user: User?, currentScore: Int, listOfUsers: [UUIDSingleUser], selectedUser: User) {
        self._user = State(initialValue: user)
        self._currentScore = State(initialValue: currentScore)
        self._listOfUsers = State(initialValue: listOfUsers)
        self.selectedUser = selectedUser

    }
    
    var body: some View {
        
        TabView {
            Group{
                MenuView(user: $user, selectedUser: selectedUser, currentScore: currentScore!)
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                LeaderboardView(listOfUsers: listOfUsers!, selectedUser: selectedUser)
                    .tabItem {
                        Label("Leaderboard", systemImage: "trophy.fill")
                    }
            }
            .toolbar(.visible, for: .tabBar)
            .toolbarBackground(
                Color.lgBackground,
                    for: .tabBar)
        }
    }
}

#Preview {
    SwiftUIView(user: nil, currentScore: 0, listOfUsers : [], selectedUser: User(
        id: "auth1|6552867564e79113efcb65f7",
        email: "example@gmail.com",
        nickname: "example"))
}
