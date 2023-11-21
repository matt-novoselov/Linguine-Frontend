import SwiftUI
import Auth0

struct LessonCompleteView: View {
    @Binding var path: [Int]
    var selectedUser: User
    @Binding var totalScore: Int
    @Binding var currentScore: Int
    
    var body: some View {
        ZStack{
            VStack{
                UILottieView(lottieName: "confetti", playOnce: true)
            }
            .ignoresSafeArea()
            
            VStack(spacing: 40) {
                UILottieView(lottieName: "dog_walking")
                    .frame(height: 175)

                Text("Lesson complete!")
                    .font(Font.custom("DINNextRoundedLTPro-Bold", size: 32))
                    .foregroundColor(.lgPinkButton)
                
                summuryBox(earnedXP: totalScore)
                
                Spacer()
                
                dropButton(title: "Continue", action: {
                    path = []
                    totalScore=0}, style: .standart)
                    .padding(.bottom)
            }
            .padding(.horizontal)
            .padding(.top, 150)
        }
        .onAppear {
            Task {
                do {
                    _ = try await updateScoreById(userId: selectedUser.id, newScore: totalScore)
                    currentScore += totalScore
                    print("Updated score \(totalScore)")
                } catch {
                    print(error)
                }
            }
        }
        .background(Color.lgBackground.ignoresSafeArea())
    }
}

#Preview {
    LessonCompleteView(
        path: .constant([]),
        selectedUser:
            User(
                id: "auth1|6552867564e79113efcb65f7",
                email: "example@gmail.com",
                nickname: "example"),
        totalScore: .constant(0),
        currentScore: .constant(0)
    )
}
