import SwiftUI
import Auth0

struct LessonCompleteView: View {
    var selected_user: User
    var earnedXP: Int
    
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
                
                summuryBox(earnedXP: earnedXP)
                
                Spacer()
                
                dropButton(title: "Continue", action: {})
                    .padding(.bottom)
            }
            .padding(.horizontal)
            .padding(.top, 150)
        }
        .onAppear {
            Task {
                do {
                    _ = try await update_score_by_id(user_id: selected_user.id, new_score: earnedXP)
                    print("Updated score \(earnedXP)")
                } catch {
                    print(error)
                }
            }
        }
        .background(Color.lgBackground.ignoresSafeArea())
    }
}

#Preview {
    LessonCompleteView(selected_user: User(
        id: "auth1|6552867564e79113efcb65f7",
        email: "example@gmail.com",
        nickname: "example"),
    earnedXP: 800)
}
