import SwiftUI
import Auth0

struct LessonCompleteView: View {
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
                
                summuryBox()
                
                Spacer()
                
                dropButton(title: "Continue", action: {})
                    .padding(.bottom)
            }
            .padding(.horizontal)
            .padding(.top, 150)
        }.background(Color.lgBackground.ignoresSafeArea())
    }
}

#Preview {
    LessonCompleteView()
}
