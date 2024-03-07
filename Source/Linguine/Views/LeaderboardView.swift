import SwiftUI
import Auth0

struct LeaderboardView: View {
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
                ExtendedDevider()
                
                ScrollView {
                    ForEach(Array(listOfUsers.enumerated()), id: \.element.id) { index, listUser in
                        leaderboardParticipant(nickname: listUser.name, xpAmount: listUser.score, place: index+1, isHighlighted: listUser.name == selectedUser.nickname)
                            .padding(.horizontal)
                    }
                }
                .refreshable {
                    Task {
                        do {
                            listOfUsers = try await getStats()
                        } catch {
                            print(error)
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                do {
                    listOfUsers = try await getStats()
                } catch {
                    print(error)
                }
            }
        }
        .frame(maxHeight: .infinity)
        .background(Color.lgBackground.ignoresSafeArea())
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
