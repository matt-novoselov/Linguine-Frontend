//
//
//
//
//
//

import SwiftUI

// The loading screen is shown on the boot of the app, while data is being retrieved from the server
struct LoadingScreenView: View {
    var body: some View {
        VStack(spacing: 20){
            UILottieView(lottieName: "loading")
                .frame(height: 140)
            
            Text("Counting bones...")
                .font(Font.custom("DINNextRoundedLTPro-Medium", size: 24))
                .accessibilityHidden(true)
        }
        .padding(.horizontal, 40)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.lgBackground)
    }
}

#Preview {
    LoadingScreenView()
}
