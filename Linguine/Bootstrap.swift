import SwiftUI
import Auth0

struct Bootstrap: View {
    @State var user: User?
    
    var body: some View {
        if let selected_user = self.user {
            OLDProfileView(user: $user, selected_user: selected_user)
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
