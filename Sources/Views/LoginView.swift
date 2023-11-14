import SwiftUI
import Auth0

struct LoginView: View {
    @Binding var user: User?
    
    var body: some View {
        VStack {
            UILottieView(lottieName: "test_anim")
            Text("This is a login page")
            Button("Login", action: self.login)
        }
    }

    func login() {
        let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
        
        credentialsManager.credentials { result in
            switch result {
            case .success(let credentials):
                self.user = User(from: credentials.idToken)
            case .failure(let error):
                print("Failed with: \(error)")
            }
        }
        
        Auth0
            .webAuth()
            .start { result in
                switch result {
                case .success(let credentials):
                    print(credentials)
                    credentialsManager.store(credentials: credentials)
                    self.user = User(from: credentials.idToken)
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
}

#Preview {
    LoginView(user: Bootstrap().$user)
}
