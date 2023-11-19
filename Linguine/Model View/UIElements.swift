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

struct dropButtonCustomStyle {
    var mainColor: Color
    var dropColor: Color
    var textColor: Color
    var symbolColor: Color
}

enum Style: String, CaseIterable {
    case standart
    case mistake
    case correct
    case disabled
    case completed

    var color: dropButtonCustomStyle {
        switch self {
        case .standart, .completed: return dropButtonCustomStyle(mainColor: .lgPinkButton, dropColor: .lgDropPinkButton, textColor: .lgBackground, symbolColor: .white)
        case .mistake: return dropButtonCustomStyle(mainColor: .lgRedButton, dropColor: .lgDropRedButton, textColor: .lgBackground, symbolColor: .lgBackground)
        case .correct: return dropButtonCustomStyle(mainColor: .lgGreenButton, dropColor: .lgDropGreenButton, textColor: .lgBackground, symbolColor: .lgBackground)
        case .disabled: return dropButtonCustomStyle(mainColor: .lgDisabledButton, dropColor: .lgDropDisabledButton, textColor: .lgDisabledTitle, symbolColor: .lgDisabledTitle)
        }
    }
}

struct dropButton: View {
    var title: String
    var action: () -> Void
    var style: Style
    
    struct dropButtonStyle: ButtonStyle {
        var title: String
        let buttonHeight: Double = 45
        let shadowHeight: Double = 4
        var style: Style
        
        func makeBody(configuration: Configuration) -> some View {
            ZStack(alignment: .top){
                VStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: buttonHeight)
                        .foregroundColor(style.color.dropColor)
                        .padding(.top, !configuration.isPressed ? shadowHeight : 0)
                    
                    Spacer()
                }
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: buttonHeight)
                        .foregroundColor(style.color.mainColor)
                    
                    Text(title)
                        .textCase(.uppercase)
                        .font(Font.custom("DINNextRoundedLTPro-Bold", size: 16))
                        .foregroundColor(style.color.textColor)
                }
            }
            .frame(height: buttonHeight+shadowHeight)
        }
    }
    
    var body: some View {
        Button(action: style != Style.disabled ? action : {}){}
            .buttonStyle(
                dropButtonStyle(title: title, style: style)
            )
    }
}

struct dropButtonRound: View {
    var titleSymbol: String
    var action: () -> Void
    var style: Style
    
    struct dropButtonStyle: ButtonStyle {
        var titleSymbol: String
        let buttonHeight: Double = 59
        let shadowHeight: Double = 7
        var style: Style
        
        func makeBody(configuration: Configuration) -> some View {
            ZStack(alignment: .top){
                VStack{
                    Ellipse()
                        .frame(width: 71, height: buttonHeight)
                        .foregroundColor(style.color.dropColor)
                        .padding(.top, !configuration.isPressed ? shadowHeight : 0)
                    
                    Spacer()
                }
                
                ZStack{
                    Ellipse()
                        .frame(width: 71, height: buttonHeight)
                        .foregroundColor(style.color.mainColor)
                    
                    Image(systemName: style == Style.completed ? "checkmark" : titleSymbol)
                        .font(.system(size: 26))
                        .foregroundColor(style.color.symbolColor)
                        .fontWeight(.black)
                }
            }
            .frame(height: buttonHeight+shadowHeight)
            .overlay(style == Style.standart ? ProgressBar() : nil, alignment: .center)
        }
    }
    
    var body: some View {
        Button(action: style != Style.disabled ? action : {}){}
            .buttonStyle(
                dropButtonStyle(titleSymbol: titleSymbol, style: style)
            )
    }
}

struct cardButton: View {
    var title: String
    var icon_name: String
    var action: () -> Void
    var style: Style
    
    struct dropButtonStyle: ButtonStyle {
        var title: String
        var icon_name: String
        let buttonHeight: Double = 260
        let shadowHeight: Double = 4
        var style: Style
        
        func makeBody(configuration: Configuration) -> some View {
            ZStack(alignment: .top){
                VStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: buttonHeight)
                        .foregroundColor(style.color.dropColor)
                        .padding(.top, !configuration.isPressed ? shadowHeight : 0)
                    
                    Spacer()
                }
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: buttonHeight)
                        .foregroundColor(style != Style.disabled ? .lgSelectedCardButton : .lgBackground)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style.color.mainColor, lineWidth: 2)
                        .frame(height: buttonHeight)
                    
                    VStack(){
                        Spacer()
                        
                        UILottieView(lottieName: icon_name, playOnce: true)
                            .frame(height: 100)
                        
                        Spacer()
                        
                        Text(title)
                            .textCase(.lowercase)
                            .font(Font.custom("DINNextRoundedLTPro-Regular", size: 20))
                            .foregroundColor(.white)
                            .padding(.bottom)
                    }
                    .frame(maxHeight: buttonHeight, alignment: .bottom)
                }
            }
            .frame(height: buttonHeight+shadowHeight)
        }
    }
    
    var body: some View {
        Button(action: action){}
            .buttonStyle(
                dropButtonStyle(title: title, icon_name: icon_name, style: style)
            )
    }
}

struct levelResult: View {
    var correctAnswers: String
    var selectedAnswer: String
    @State var size: CGSize = .zero
    @Binding var path: [Int]
    let count: Int
    @Environment(\.dismiss) var dismiss
    
    var isCorrect: Bool {
        return correctAnswers == selectedAnswer
    }
    
    var body: some View {
        VStack(alignment: .leading ,spacing: 20){
            if isCorrect{
                Group{
                    HStack{
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 24))
                        
                        Text("Excellent!")
                            .font(Font.custom("DINNextRoundedLTPro-Bold", size: 24))
                    }
                }
                .foregroundColor(.lgGreenButton)
            }
            else{
                Group{
                    HStack{
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 24))
                        
                        Text("Incorrect")
                            .font(Font.custom("DINNextRoundedLTPro-Bold", size: 24))
                    }
                    
                    HStack(spacing:0){
                        Text("Correct Answer: ")
                            .font(Font.custom("DINNextRoundedLTPro-Bold", size: 20))
                        
                        Text(correctAnswers)
                            .font(Font.custom("DINNextRoundedLTPro-Regular", size: 20))
                    }
                }
                .foregroundColor(.lgRedButton)
            }

            dropButton(title: isCorrect ? "continue" : "got it", action: {
                path.append(count + 1)
                self.dismiss()
            }, style: isCorrect ? .correct : .mistake)
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

struct HeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat?

    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        guard let nextValue = nextValue() else { return }
        value = nextValue
    }
}

private struct ReadHeightModifier: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: HeightPreferenceKey.self, value: geometry.size.height)
        }
    }

    func body(content: Content) -> some View {
        content.background(sizeView)
    }
}

extension View {
    func readHeight() -> some View {
        self
            .modifier(ReadHeightModifier())
    }
}

struct LevelsUpBar: View {
    var action: () -> Void
    var current_score: Int?
    
    var body: some View {
        ZStack {
//            ///
//            Rectangle()
//                .frame(height: 25)
//                .foregroundColor(.green)
//                .opacity(0.2)
//            ///
            
            HStack(alignment: .center, spacing: 0){
                Text("flag")
                
                Spacer()
                
                HStack(spacing: 5){
                    Image(systemName: "bolt.fill")
                        .font(.system(size: 16))
                        .fontWeight(.heavy)
                        .foregroundColor(.lgBlueIcon)
                    
                    Text("\(current_score == nil ? 0 : current_score!) XP")
                        .font(Font.custom("DINNextRoundedLTPro-Bold", size: 18))
                        .foregroundColor(.lgBlueIcon)
                        .redacted(reason: current_score == nil ? .placeholder : .invalidated)
                }
                
                Spacer()
                
                Button(action: action){
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .font(.system(size: 18))
                        .fontWeight(.heavy)
                        .foregroundColor(.lgDropRedButton)
                }
            }
        }
    }
}

struct ProgressBar: View {
    var body: some View {
        ZStack {
            Ellipse()
                .stroke(lineWidth: 7.0)
                .foregroundColor(.lgDisabledButton)
            
            Ellipse()
                .trim(from: 0.75, to: 1.0)
                .stroke(style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.lgBackground)
            
            Ellipse()
                .trim(from: 0.75, to: 1.0)
                .stroke(style: StrokeStyle(lineWidth: 7.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.lgPinkButton)
        }
        .frame(width: 90, height: 85)
        .padding(.bottom, 8)
        .overlay(StartBubble(), alignment: .top)
    }
}

struct StartBubble: View {
    var body: some View {
        ZStack {
            Text("START")
                .font(Font.custom("DINNextRoundedLTPro-Bold", size: 16))
//                .foregroundColor(.lgPinkButton)
                .foregroundColor(.red)
        }
    }
}

#Preview {
    VStack{
        dropButtonRound(titleSymbol: "star.fill", action: {}, style: .standart)
    }
    .padding(.horizontal)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.lgBackground.ignoresSafeArea())
}
