import SwiftUI

struct LoadingScreenView: View {
    var body: some View {
        VStack{
            VStack(spacing: 20) {
                UILottieView(lottieName: "loading")
                    .frame(height: 140)
                
                Text("Counting bones...")
                    .font(Font.custom("DINNextRoundedLTPro-Medium", size: 24))
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.lgBackground.ignoresSafeArea())
    }
}

#Preview {
    LoadingScreenView()
}
