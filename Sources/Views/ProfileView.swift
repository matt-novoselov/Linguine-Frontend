import SwiftUI
import Auth0

struct ProfileView: View {
    @Binding var user: User?
    var selected_user: User
    @State private var current_score = 0
    @State private var new_score = 0
    
    var body: some View {
        
        VStack {
            Text("User id: \(selected_user.id)")
            Text("User email: \(selected_user.email)")
            Text("User nickname: @\(selected_user.nickname)")
            HStack{
                Text("User score: \(current_score) XP")
                Button("Fetch", action: {})
            }
            HStack{
                TextField("Enter your score", value: $new_score, format: .number)
                Button("Fetch", action: {})
            }
            
            Spacer()
            
            Button("Logout", action: logout_hmm)
        }
        
    }
    
    func logout_hmm() {
        Auth0
            .webAuth()
            .clearSession { result in
                switch result {
                case .success:
                    self.user = nil
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
}

#Preview {
    ProfileView(
        user: Bootstrap().$user,
        selected_user: User(
            id: "example123456789",
            email: "example@gmail.com",
            nickname: "example")
    )
}
