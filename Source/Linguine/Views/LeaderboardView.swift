//
//
//
//
//
//

import SwiftUI
import Auth0

// Leaderboard view is used to display the statistics of the scores of users
struct LeaderboardView: View {
    
    // The list of users retrieved from the database
    @State var listOfUsers: [UUIDSingleUser]
    var selectedUser: User
    
    var body: some View {
        VStack{
            UILottieView(lottieName: "cup_demo", playOnce: true, animationSpeed: 0.8)
                .frame(height: 180)
            
            Text("Leaderboard")
                .font(Font.custom("DINNextRoundedLTPro-Bold", size: 24))
                .padding(.top, -20)
                .accessibilitySortPriority(1)
            
            VStack(spacing:0){
                ExtendedDivider()
                
                ScrollView {
                    ForEach(Array(listOfUsers.enumerated()), id: \.element.id) { index, listUser in
                        LeaderboardParticipant(nickname: listUser.name, scoreAmount: listUser.score, place: index+1, isHighlighted: listUser.name == selectedUser.nickname)
                            .padding(.horizontal)
                    }
                }
                
                // Make new request for the list of users on list refresh
                .refreshable {
                    retrieveUsers()
                }
                
            }
        }
        .frame(maxHeight: .infinity)
        .background(.lgBackground)
        
        // Make new request for the list of users on initial appear
        .onAppear {
            retrieveUsers()
        }

    }
    
    // Function that retrieves list of users from the database
    func retrieveUsers(){
        Task {
            do {
                listOfUsers = try await getStats()
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    LeaderboardView(
        listOfUsers: [], selectedUser: User(
            id: "auth1|6552867564e79113efcb65f7",
            email: "example@gmail.com",
            nickname: "example")
    )
}
