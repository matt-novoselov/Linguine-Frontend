import SwiftUI

struct Bootstrap: View {
    @State var user: User?
    
    var body: some View {
        if let selected_user = self.user {
            ProfileView(user: $user, selected_user: selected_user)
        }
        else {
            LoginView(user: $user)
        }
    }
}

#Preview {
    Bootstrap(user: nil)
}
