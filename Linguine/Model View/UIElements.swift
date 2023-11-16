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
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(.lgBackground)
                }
            }
        }
        .buttonStyle(PressEffectButtonStyle())
        
    }
}

#Preview {
    dropButton(title: "get started", action: {print("Test tap")})
        .padding(.horizontal)
}
