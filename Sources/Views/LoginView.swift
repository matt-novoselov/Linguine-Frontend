import SwiftUI

struct LoginView: View {
    @State var user: User?

    var body: some View {
        VStack{
            if let user = self.user {
                //Profile page
                VStack {
                    Text(user.id)
                    Text(user.email)
                    Text(user.nickname)
                    Button("Logout", action: self.logout)
                }
                //Profile page
                
            }
            
            else {
                //Login page
                VStack {
                    Text("This is login page")
                    Button("Login", action: self.login)
                }
                //Login page
            }
        }
    }
}

#Preview {
    LoginView(user: nil)
}
