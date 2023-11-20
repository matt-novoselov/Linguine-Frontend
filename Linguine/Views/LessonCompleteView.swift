import SwiftUI
import Auth0

struct LessonCompleteView: View {
    @Binding var path: [Int]
    var selected_user: User
    @Binding var totalScore: Int
    @Binding var current_score: Int
    
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
                    _ = try await update_score_by_id(user_id: selected_user.id, new_score: totalScore)
                    current_score += totalScore
                    print("Updated score \(totalScore)")
                } catch {
                    print(error)
                }
            }
        }
        .background(Color.lgBackground.ignoresSafeArea())
    }
}

//#Preview {
//    LessonCompleteView(path: [], selected_user: User(
//        id: "auth1|6552867564e79113efcb65f7",
//        email: "example@gmail.com",
//        nickname: "example"),
//    earnedXP: 220)
//}
