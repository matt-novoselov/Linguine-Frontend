import SwiftUI

struct UILottieView: View {
    var lottieName: String
    var playOnce: Bool = false
    var animationSpeed: Double = 1.0
    
    var body: some View {
        if let fileURL = Bundle.main.url(forResource: lottieName, withExtension: "lottie"){
            LottieView(url: fileURL, playOnce: playOnce, animationSpeed: animationSpeed)
        }
        else{
            Text("Lottie not found")
        }
    }
}

struct PressEffectButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}

struct dropButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack(alignment: .top){
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 49)
                    .foregroundColor(.lgDropPinkButton)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 45)
                        .foregroundColor(.lgPinkButton)
                    
                    Text(title)
                        .textCase(.uppercase)
                        .font(Font.custom("DINNextRoundedLTPro-Bold", size: 16))
                        .foregroundColor(.lgBackground)
                }
            }
        }
        .buttonStyle(PressEffectButtonStyle())
        
    }
}

struct summuryBox: View {
    var title: String = "total xp"
    var earnedXP: Int = 0
    let frameHeight: Double = 85
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 17)
                .frame(height: frameHeight)
                .foregroundColor(.lgPinkButton)
            
            VStack{
                Text(title)
                    .textCase(.uppercase)
                    .font(Font.custom("DINNextRoundedLTPro-Bold", size: 14))
                    .foregroundColor(.lgBackground)
                    .padding(.top, 6)
                
                Spacer()
            }
            .frame(maxHeight: frameHeight)
            
            VStack{
                Spacer()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 60)
                        .foregroundColor(.lgBackground)
                    
                    HStack(spacing: 5){
                        LightningIcon()
                            .frame(width: 15,height: 18)
                            .foregroundColor(.lgPinkButton)
                        
                        Text("\(earnedXP)")
                            .textCase(.uppercase)
                            .font(Font.custom("DINNextRoundedLTPro-Bold", size: 20))
                            .foregroundColor(.lgPinkButton)
                    }
                }
            }
            .padding(.all, 2)
            .frame(maxHeight: frameHeight)
        }
    }
}

struct leaderboardParticipant: View {
    var nickname: String = "example"
    var xpAmount: Int = 0
    var place: Int = 0
    var isHighlighted: Bool = false
    
    var body: some View {
        ZStack{
            Rectangle()
                .padding(.horizontal, -50)
                .ignoresSafeArea()
                .frame(height: 65)
                .foregroundColor(.lgLeaderboardHighlight)
                .opacity(isHighlighted ? 1 : 0)
            
            HStack(spacing: 20){
                Text("\(place)")
                    .font(Font.custom("DINNextRoundedLTPro-Bold", size: 16))
                
                ZStack{
                    Circle()
                        .frame(height: 45)
                    
                    Text(nickname.prefix(1))
                        .textCase(.uppercase)
                        .font(Font.custom("DINNextRoundedLTPro-Bold", size: 24))
                        .foregroundColor(.lgBackground)
                        .padding(.top, 4.5)
                }
                
                Text("@\(nickname)")
                    .font(Font.custom("DINNextRoundedLTPro-Bold", size: 18  ))
                
                Spacer()
                
                Text("\(xpAmount) XP")
                    .font(Font.custom("DINNextRoundedLTPro-regular", size: 18))
            }
        }
    }
}

struct ExtendedDevider: View {

    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 3)
                .foregroundColor(.lgLeaderboardHighlight)
                .padding(.horizontal, -50)
        }
    }
}

#Preview {
    VStack{
        ExtendedDevider()
            .padding(.horizontal)
        
        Rectangle()
    }

}
