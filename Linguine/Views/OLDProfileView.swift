import SwiftUI
import Auth0

struct OLDProfileView: View {
    @Binding var user: User?
    var selected_user: User
    @State private var current_score = 0
    @State private var new_score = 0
    @State private var listOfUsers: [UUIDSingleUser] = []
    
    var body: some View {
        VStack {
            
            HStack{
                Text("User score: \(current_score) XP")
                Button(
                    "Fetch score",
                    action: {
                        Task {
                            do {
                                current_score = try await get_score_by_id(user_id: selected_user.id)
                                print("Fetched score \(current_score)")
                            } catch {
                                print(error)
                            }
                        }
                    }
                )
            }
            
            HStack{
                TextField("Enter your score", value: $new_score, format: .number)
                Button(
                    "Push",
                    action: {
                        Task {
                            do {
                                current_score =  try await update_score_by_id(user_id: selected_user.id, new_score: new_score)
                                print("Updated score \(current_score)")
                            } catch {
                                print(error)
                            }
                        }
                    }
                )
            }
            
            Button(
                "Fetch stats",
                action: {
                    Task {
                        do {
                            listOfUsers = try await get_stats()
                            print("Fetched stats")
                        } catch {
                            print(error)
                        }
                    }
                }
            )
            
            Button(
                "Add user to database",
                action: {
                    Task {
                        do {
                            try await add_user_to_database(user_id: selected_user.id, nickname: selected_user.nickname)
                            print("Added user to database, if he was not there")
                        } catch {
                            print(error)
                        }
                    }
                }
            )
            
            NavigationView {
                List(listOfUsers) { user in
                    HStack{
                        Text(user.name)
                        Spacer()
                        Text("\(user.score) XP")
                    }
                }
                .navigationTitle("User List")
            }
            
            Spacer()
            
            Button("Logout", action: self.logout)
        }
        .onAppear {
            Task {
                do {
                    current_score = try await get_score_by_id(user_id: selected_user.id)
                    listOfUsers = try await get_stats()
                } catch {
                    print(error)
                }
            }
        }
    }
    
    func logout() {
        let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
        
        Auth0
            .webAuth()
            .clearSession { result in
                switch result {
                case .success:
                    _ = credentialsManager.clear()
                    self.user = nil
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
}

#Preview {
    OLDProfileView(
        user: Bootstrap().$user,
        selected_user: User(
            id: "auth1|6552867564e79113efcb65f7",
            email: "example@gmail.com",
            nickname: "example")
    )
}
