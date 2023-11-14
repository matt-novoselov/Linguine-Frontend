import SwiftUI
import Auth0

struct LoginView: View {
    @Binding var user: User?
    
    var body: some View {
        VStack {
            UILottieView(lottieName: "test_anim")
            Text("This is a login page")
            Button("Login", action: login_hmm)
        }
    }
    
    func login_hmm() {
        Auth0
            .webAuth()
            .start { result in
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
    LoginView(user: Bootstrap().$user)
}
