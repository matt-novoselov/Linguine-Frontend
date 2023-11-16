import SwiftUI
import Auth0

struct LoginView: View {
    @Binding var user: User?
    
    var body: some View {
        VStack{
            VStack {
                UILottieView(lottieName: "dog_main", animationSpeed: 0.4)
                
                Text("linguine")
                    .font(.system(size: 40))
                
                Text("Learn languages. Open worlds.")
                    .font(.system(size: 18))
                
                dropButton(title: "Get started", action: self.login)
                    .padding(.bottom)
            }
            .padding(.horizontal)
        }
        .background(Color.lgBackground.ignoresSafeArea())
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
                    _ = credentialsManager.store(credentials: credentials)
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
