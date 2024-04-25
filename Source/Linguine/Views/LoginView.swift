//
//
//
//
//
//

import SwiftUI
import Auth0

// The View that is displayed when the user is not logged in to the system
struct LoginView: View {
    
    // Used to store login information about the user
    @Binding var user: User?
    
    var body: some View {
        
        VStack(spacing: 20) {
            UILottieView(lottieName: "dog_main", animationSpeed: 0.4)
                .frame(height: 140)
            
            Text("linguine")
                .font(Font.custom("Feather", size: 40))
                .foregroundColor(.lgPinkTitle)
            
            Text("Learn languages. Open worlds.")
                .font(Font.custom("DINNextRoundedLTPro-Regular", size: 18))
            
            Spacer()
            
            DropButton(title: "Get started", action: self.login, style: .standard)
                .padding(.bottom)
        }
        .padding(.horizontal)
        .padding(.top, 150)
        .background(.lgBackground)
    }
    
    // Function to handle user login
    func login() {
        // Create a credentials manager using Auth0 authentication
        let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
        
        // Request stored credentials from the credentials manager
        credentialsManager.credentials { result in
            switch result {
            // If successfully retrieved stored credentials
            case .success(let credentials):
                // Initialize user using the ID token from the retrieved credentials
                self.user = User(from: credentials.idToken)
                
            // If failed to retrieve stored credentials
            case .failure(let error):
                // Print the error
                print("Failed with: \(error)")
            }
        }
        
        // Start the web authentication flow using Auth0
        Auth0
            .webAuth()
            .start { result in
                switch result {
                // If web authentication is successful
                case .success(let credentials):
                    // Store the obtained credentials using the credentials manager
                    _ = credentialsManager.store(credentials: credentials)
                    // Initialize user using the ID token from the obtained credentials
                    self.user = User(from: credentials.idToken)
                    
                // If web authentication fails
                case .failure(let error):
                    // Print the error
                    print("Failed with: \(error)")
                }
            }
    }
    
}

#Preview {
    LoginView(user: ContentView().$user)
}
