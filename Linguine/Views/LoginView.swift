import SwiftUI
import Auth0

struct LoginView: View {
    @Binding var user: User?
    
    var body: some View {
        VStack{
            VStack(spacing: 20) {
                UILottieView(lottieName: "dog_main", animationSpeed: 0.4)
                    .frame(height: 140)
                
                Text("linguine")
                    .font(Font.custom("Feather", size: 40))
                    .foregroundColor(.lgPinkTitle)
                
                Text("Learn languages. Open worlds.")
                    .font(Font.custom("DINNextRoundedLTPro-Regular", size: 18))
                
                Spacer()
                
                dropButton(title: "Get started", action: self.login, style: .standart)
                    .padding(.bottom)
            }
            .padding(.horizontal)
            .padding(.top, 150)
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
