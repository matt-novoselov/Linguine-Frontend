import SwiftUI
import Auth0

struct Bootstrap: View {
    @State var user: User?
    @State private var loadingFinished: Bool = false
    @State var currentScore: Int?
    @State var listOfUsers: [UUIDSingleUser]?
    
    var body: some View {
        if let selectedUser = self.user {
            VStack{
                if loadingFinished{
                    TabView {
                        MenuView(user: $user, selectedUser: selectedUser, currentScore: currentScore!)
                            .tabItem {
                                Label("Home", systemImage: "house.fill")
                            }
                            .accessibilityLabel("Home")
                        LeaderboardView(listOfUsers: listOfUsers!, selectedUser: selectedUser)
                            .tabItem {
                                Label("Leaderboard", systemImage: "trophy.fill")
                            }
                            .accessibilityLabel("Leaderboard")
                    }
                }
                else{
                    LoadingScreenView()
                }
            }.onAppear(){
                loadingFinished = false
                Task {
                    do {
                        try await addUserToDatabase(userId: selectedUser.id, nickname: selectedUser.nickname)
                        currentScore = try await getScoreById(userId: selectedUser.id)
                        listOfUsers = try await getStats()
                        loadingFinished = true
                    } catch {
                        print(error)
                    }
                }
            }
        }
        else {
            LoginView(user: $user)
                .onAppear{tokenLogin()}
        }
    }
    
    func tokenLogin() {
        let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
        
        credentialsManager.credentials { result in
            switch result {
            case .success(let credentials):
                self.user = User(from: credentials.idToken)
            case .failure(let error):
                print("Failed with: \(error)")
            }
        }
    }
}

#Preview {
    Bootstrap(user: nil)
}
