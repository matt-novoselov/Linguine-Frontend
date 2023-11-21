import SwiftUI

struct SingleImageLevelView: View {
    @State private var showingCredits = false
    @State var detentHeight: CGFloat = 0
    @Binding var path: [Int]
    let count: Int
    var selectedLevel: Imagelevel
    @Binding var totalScore: Int
    @State private var inputFieldText: String = ""
    
    init(path: Binding<[Int]>, count: Int, selectedLevel: Imagelevel, totalScore: Binding<Int>) {
        self._path = path
        self.count = count
        self.selectedLevel = selectedLevel
        self._totalScore = totalScore
        
        let randomImageLevelCard = selectedLevel.imageLevelCards.randomElement()
        _randomImageLevelCard = State(initialValue: randomImageLevelCard)
    }
    
    @State private var randomImageLevelCard: ImagelevelCard?
    
    var body: some View {        
        VStack{
            VStack(alignment: .leading ,spacing: 20){
                Button(action:{path = []}){
                    Image(systemName: "xmark")
                        .font(.system(size: 30))
                        .fontWeight(.medium)
                        .foregroundColor(.lgDisabledTitle)
                        .padding(.top)
                }
                
                ZStack{
                    let borderSize: Double = 180
                    VStack(spacing: 20){
                        UILottieView(lottieName: randomImageLevelCard!.lottie, playOnce: true)
                            .frame(height: 100)
                        
                        Text(randomImageLevelCard!.english)
                            .font(Font.custom("DINNextRoundedLTPro-Regular", size: 20))
                    }.frame(maxHeight: borderSize)
                                        
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.lgDisabledButton, lineWidth: 2)
                        .frame(width: borderSize, height: borderSize)
                }

                TextField(
                    "Answer",
                    text: $inputFieldText
                )
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                
                dropButton(title: "check", action: {showingCredits.toggle()}, style: inputFieldText != "" ? .standart : .disabled)
                    .padding(.bottom)
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.lgBackground.ignoresSafeArea())
        .sheet(isPresented: $showingCredits) {
            levelResult(correctAnswers: randomImageLevelCard!.italian, selectedAnswer: inputFieldText.lowercased(), path: $path, count: count, totalScore: $totalScore)
                .readHeight()
                .onPreferenceChange(HeightPreferenceKey.self) { height in
                    if let height {
                        self.detentHeight = height
                    }
                }
                .presentationDetents([.height(self.detentHeight)])
                .background(.lgLeaderboardHighlight)
                .interactiveDismissDisabled()
        }
    }
}

#Preview {
    SingleImageLevelView(path: .constant([]), count: 0, selectedLevel: ImageLevelLibrary().levels[0], totalScore: .constant(0)
    )
}
