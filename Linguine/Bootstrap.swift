import SwiftUI
import Auth0

struct Bootstrap: View {
    @State var user: User?
    @State private var loadingFinished: Bool = false
    @State var currentScore: Int?
    
    var body: some View {
        if let selectedUser = self.user {
            VStack{
                if loadingFinished{
                    TabViewBootstrap(selectedUser: selectedUser, currentScore: currentScore ?? 0, user: $user)
                }
                else{
                    LoadingScreenView()
                }
            }.onAppear(){
                Task {
                    do {
                        try await addUserToDatabase(userId: selectedUser.id, nickname: selectedUser.nickname)
                        currentScore = try await getScoreById(userId: selectedUser.id)
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
