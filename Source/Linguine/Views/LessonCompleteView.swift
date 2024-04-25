//
//
//
//
//
//

import SwiftUI
import Auth0

// Lesson complete view is displayed on the end of the lesson and provides the user with the final score of the lesson
struct LessonCompleteView: View {
    
    // Generate the path for the lesson
    @Binding var path: [Int]
    
    // Used to get information about user. Ex: name, email, uid and etc.
    var selectedUser: User
    
    // Score earned from the last lesson
    @Binding var totalScore: Int
    
    // Users XP score, retrieved from the database
    @Binding var currentScore: Int
    
    var body: some View {
        
        ZStack{
            UILottieView(lottieName: "confetti", playOnce: true)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                UILottieView(lottieName: "dog_walking")
                    .frame(height: 175)
                
                Text("Lesson complete!")
                    .font(Font.custom("DINNextRoundedLTPro-Bold", size: 32))
                    .foregroundColor(.lgPinkButton)
                
                SummaryBox(earnedXP: totalScore)
                
                Spacer()
                
                DropButton(title: "Continue", action: {
                    path = []
                    totalScore=0}, style: .standard)
                .padding(.bottom)
            }
            .padding(.horizontal)
            .padding(.top, 150)
        }
        .background(.lgBackground)
        
        // Update the score for the user after the lesson is complete
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
