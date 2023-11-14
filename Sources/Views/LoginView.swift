import SwiftUI

struct LoginView: View {
    @State var user: User?
    //@State private var joke: String = ""

    var body: some View {

        VStack{
            if let user = self.user {
                //Profile page
                VStack {
                    Text("User id: \(user.id)")
                    Text("User email: \(user.email)")
                    Text("User nickname: @\(user.nickname)")
                    HStack{
                        Text("User score: \(120)XP")
                        Button("Fetch", action: {})
                    }
                    HStack{
                        Text("Add score")
                        Button("Fetch", action: {})
                    }
                    
                    Spacer()
                    
                    Button("Logout", action: self.logout)
                    

                }
                //Profile page
            }
            
            else {
                //Login page
                VStack {
                    Text("This is login page")
                    Button("Login", action: self.login)
                    UILottieView(lottieName: "test_anim")
                }
                //Login page
            }
        }
    }
}

#Preview {
    LoginView(user: nil)
}
