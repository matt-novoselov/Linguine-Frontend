import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    let url: URL
    var playOnce: Bool = false
    var animationSpeed: Double = 1.0
    
    func makeUIView(context: Context) -> some UIView{
        UIView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        let animationView = LottieAnimationView()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        uiView.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: uiView.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: uiView.heightAnchor),
        ])
        
        DotLottieFile.loadedFrom(url: url) { result in
            switch result{
            case .success(let success):
                animationView.loadAnimation(from: success)
                if playOnce{
                    animationView.loopMode = .playOnce
                }
                else{
                    animationView.loopMode = .loop
                }
                animationView.play()
                animationView.animationSpeed = animationSpeed
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
