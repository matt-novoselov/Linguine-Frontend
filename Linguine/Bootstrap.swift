import SwiftUI
import Auth0

struct Bootstrap: View {
    @State var user: User?
    
    var body: some View {
        if let selected_user = self.user {
//            LeaderboardView(selected_user: selected_user)
            
            TabView {
                LeaderboardView(selected_user: selected_user)
                    .tabItem {
                        Label("Learners", systemImage: "person.2.fill")
                    }
                LessonCompleteView(selected_user: selected_user, earnedXP: 0)
                    .tabItem {
                        Label("Teams", systemImage: "person.3.fill")
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
