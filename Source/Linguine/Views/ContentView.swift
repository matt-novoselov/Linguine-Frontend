//
//
//
//
//
//

import SwiftUI
import Auth0

struct ContentView: View {
    
    // Used to store login information about the user
    @State var user: User?
    
    // Bool that is true when all data from the server was loaded after opening app
    @State private var loadingFinished: Bool = false
    
    // Users XP score, retrieved from the database
    @State var currentScore: Int?
    
    // Retrieved list of users from the database
    @State var listOfUsers: [UUIDSingleUser]?
    
    var body: some View {
        
        if let selectedUser = self.user {
            VStack{
                if loadingFinished{
                    TabView {
                        // Menu View
                        MenuView(user: $user, selectedUser: selectedUser, currentScore: currentScore!)
                            .tabItem {
                                Label("Home", systemImage: "house.fill")
                            }
                            .accessibilityLabel("Home")
                        
                        // Leaderboard View
                        LeaderboardView(listOfUsers: listOfUsers!, selectedUser: selectedUser)
                            .tabItem {
                                Label("Leaderboard", systemImage: "trophy.fill")
                            }
                            .accessibilityLabel("Leaderboard")
                    }
                } else{
                    // Present Loading screen, while app is loading info from the database
                    LoadingScreenView()
                }
            }
            
            .onAppear(){
                // Set loadingFinished to false, until loading is finished
                loadingFinished = false
                Task {
                    do {
                        // Add user to the database if he doest exist
                        try await addUserToDatabase(userId: selectedUser.id, nickname: selectedUser.nickname)
                        // Retrieve current user score from the database
                        currentScore = try await getScoreById(userId: selectedUser.id)
                        // Retrieve list of users from the database
                        listOfUsers = try await getStats()
                        // Set loadingFinished to true, because loading is finished
                        loadingFinished = true
                    } catch {
                        print(error)
                    }
                }
            }
            
        } else {
            // Present Login Screen if the user is not logged in
            LoginView(user: $user)
                .onAppear{tokenLogin()}
        }
        
    }
    
    // Login with the token saved in the credentials manager
    // Token is needed, so the app can store login information between sessions
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
    ContentView(user: nil)
}
