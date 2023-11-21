import SwiftUI
import Auth0

struct Bootstrap: View {
    @State var user: User?
    @State private var loadingFinished: Bool = false
    @State var current_score: Int?
    
    var body: some View {
        if let selected_user = self.user {
            VStack{
                if loadingFinished{
                    TabViewBootstrap(selected_user: selected_user, current_score: current_score ?? 0, user: $user)
                }
                else{
                    LoadingScreenView()
                }
            }.onAppear(){
                Task {
                    do {
                        try await add_user_to_database(user_id: selected_user.id, nickname: selected_user.nickname)
                        current_score = try await get_score_by_id(user_id: selected_user.id)
                        loadingFinished = true
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
