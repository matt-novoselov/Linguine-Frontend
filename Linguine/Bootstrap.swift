import SwiftUI
import Auth0

struct Bootstrap: View {
    @State var user: User?
    
    var body: some View {
        if let selected_user = self.user {
            TabView {
                LevelsSelectionView(user: $user, selected_user: selected_user)
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                LeaderboardView(selected_user: selected_user)
                    .tabItem {
                        Label("Leaderboard", systemImage: "trophy.fill")
                    }
            }.onAppear(){
                Task {
                    do {
                        print(selected_user.id)
                        print(selected_user.nickname)
                        try await add_user_to_database(user_id: selected_user.id, nickname: selected_user.nickname)
                    } catch {
                        print(error)
                    }
                }
            }
        }
        else {
            LoginView(user: $user)
                .onAppear{token_login()}
        }
    }

    func token_login() {
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
