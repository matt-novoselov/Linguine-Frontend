import SwiftUI

struct UILottieView: View {
    var lottieName: String
    
    var body: some View {
        if let fileURL = Bundle.main.url(forResource: lottieName, withExtension: "lottie"){
            LottieView(url: fileURL)
        }
        else{
            Text("Lottie not found")
        }
    }
}

#Preview {
    UILottieView(lottieName: "test_anim")
}
