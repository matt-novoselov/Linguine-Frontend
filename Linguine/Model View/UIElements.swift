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
    var isTemplate: Bool = false
    
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
                    .redacted(reason: isTemplate ? .placeholder : .invalidated)
                
                ZStack{
                    Circle()
                        .frame(height: 45)
                    
                    Text(nickname.prefix(1))
                        .textCase(.uppercase)
                        .font(Font.custom("DINNextRoundedLTPro-Bold", size: 24))
                        .foregroundColor(.lgBackground)
                        .padding(.top, 4.5)
                        .opacity(isTemplate ? 0 : 1)
                }
                
                Text("@\(nickname)")
                    .font(Font.custom("DINNextRoundedLTPro-Bold", size: 18  ))
                    .redacted(reason: isTemplate ? .placeholder : .invalidated)
                
                Spacer()
                
                Text("\(xpAmount) XP")
                    .font(Font.custom("DINNextRoundedLTPro-regular", size: 18))
                    .redacted(reason: isTemplate ? .placeholder : .invalidated)
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

struct dropButton: View {
    var title: String
    var action: () -> Void
    var buttonActive: Bool = true
    
    struct dropButtonStyle: ButtonStyle {
        var title: String
        var buttonActive: Bool = true
        let buttonHeight: Double = 45
        let shadowHeight: Double = 4
        
        func makeBody(configuration: Configuration) -> some View {
            ZStack(alignment: .top){
                VStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: buttonHeight)
                        .foregroundColor(buttonActive ? .lgDropPinkButton : .lgDropDisabledButton)
                        .padding(.top, !configuration.isPressed ? shadowHeight : 0)
                    
                    Spacer()
                }

                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: buttonHeight)
                        .foregroundColor(buttonActive ? .lgPinkButton : .lgDisabledButton)
                    
                    Text(title)
                        .textCase(.uppercase)
                        .font(Font.custom("DINNextRoundedLTPro-Bold", size: 16))
                        .foregroundColor(buttonActive ? .lgBackground : .lgDisabledTitle)
                }
            }
            .frame(height: buttonHeight+shadowHeight)
        }
    }
    
    var body: some View {
        Button(action: buttonActive ? action : {}){}
            .buttonStyle(
                dropButtonStyle(title: title, buttonActive: buttonActive)
            )
    }
}

struct dropButtonRound: View {
    var titleSymbol: String
    var action: () -> Void
    var buttonActive: Bool = true
    
    struct dropButtonStyle: ButtonStyle {
        var titleSymbol: String
        var buttonActive: Bool = true
        let buttonHeight: Double = 59
        let shadowHeight: Double = 7
        
        func makeBody(configuration: Configuration) -> some View {
            ZStack(alignment: .top){
                VStack{
                    Ellipse()
                        .frame(width: 71, height: buttonHeight)
                        .foregroundColor(buttonActive ? .lgDropPinkButton : .lgDropDisabledButton)
                        .padding(.top, !configuration.isPressed ? shadowHeight : 0)
                    
                    Spacer()
                }
                
                ZStack{
                    Ellipse()
                        .frame(width: 71, height: buttonHeight)
                        .foregroundColor(buttonActive ? .lgPinkButton : .lgDisabledButton)
                    
                    Image(systemName: titleSymbol)
                        .font(Font.custom("DINNextRoundedLTPro-Bold", size: 26))
                        .foregroundColor(buttonActive ? .white : .lgDisabledTitle)
                }
            }.frame(height: buttonHeight+shadowHeight)
        }
    }
    
    var body: some View {
        Button(action: buttonActive ? action : {}){}
            .buttonStyle(
                dropButtonStyle(titleSymbol: titleSymbol, buttonActive: buttonActive)
            )
    }
}

#Preview {
    VStack{
//        dropButtonRound(titleSymbol: "star.fill", action: {print("test_tap")})
//        
//        dropButton(title: "hello world!", action: {})
        
        leaderboardParticipant(isTemplate: true)
    }
    .padding(.horizontal)
}
