import SwiftUI

struct ImageLevelView: View {
    @State private var selectedButtonIndex: Int?
    @State private var showingCredits = false
    @State var detentHeight: CGFloat = 0
    @Binding var path: [Int]
    let count: Int
    var selectedLevel: Imagelevel
    @Binding var totalScore: Int
    
    init(path: Binding<[Int]>, count: Int, selectedLevel: Imagelevel, totalScore: Binding<Int>) {
        self._path = path
        self.count = count
        self.selectedLevel = selectedLevel
        self._totalScore = totalScore
        
        let randomImageLevelCard = selectedLevel.imageLevelCards.randomElement()
        let generatedLevel = ImagelevelGeneration(prompt: randomImageLevelCard?.italian ?? "", correctAnswer: randomImageLevelCard?.english ?? "")
        _randomImageLevelCard = State(initialValue: randomImageLevelCard)
        _generatedLevel = State(initialValue: generatedLevel)
    }
    
    @State private var randomImageLevelCard: ImagelevelCard?
    @State private var generatedLevel: ImagelevelGeneration?
    
    var body: some View {
        let amountOfMenus: Int = selectedLevel.imageLevelCards.count
        
        VStack{
            VStack(alignment: .leading ,spacing: 20){
                Button(action:{path = []}){
                    Image(systemName: "xmark")
                        .font(.system(size: 30))
                        .fontWeight(.medium)
                        .foregroundColor(.lgDisabledTitle)
                        .padding(.top)
                        .accessibilityLabel("Exit level")
                        .accessibilitySortPriority(-1)
                }
                
                Text("Select the correct image")
                    .font(Font.custom("DINNextRoundedLTPro-Bold", size: 24))
                    .accessibilitySortPriority(1)
                    .accessibilityLabel("Select the correct answer")
                
                Text(generatedLevel!.prompt)
                    .font(Font.custom("DINNextRoundedLTPro-Medium", size: 20))
                    .foregroundColor(.lgPinkButton)
                    .underline()
                
                HStack(spacing: 20){
                    ForEach(0..<(amountOfMenus  + 1) / 2, id: \.self) { i in
                        cardButton(title: selectedLevel.imageLevelCards[i].english, iconName: selectedLevel.imageLevelCards[i].lottie, action: {selectedButtonIndex=i}, style: selectedButtonIndex==i ? .standart : .disabled)
                    }
                }
                
                HStack(spacing: 20){
                    ForEach((amountOfMenus  + 1) / 2..<amountOfMenus, id: \.self) { i in
                        cardButton(title: selectedLevel.imageLevelCards[i].english, iconName: selectedLevel.imageLevelCards[i].lottie, action: {selectedButtonIndex=i}, style: selectedButtonIndex==i ? .standart : .disabled)
                    }
                }
                
                dropButton(title: "check", action: {showingCredits.toggle()}, style: selectedButtonIndex != nil ? .standart : .disabled)
                    .padding(.bottom)
            }
            .padding(.horizontal)
        }
        .background(Color.lgBackground.ignoresSafeArea())
        .sheet(isPresented: $showingCredits) {
            levelResult(correctAnswers: generatedLevel!.correctAnswer, selectedAnswer: selectedLevel.imageLevelCards[selectedButtonIndex!].english, path: $path, count: count, totalScore: $totalScore)
                .readHeight()
                .onPreferenceChange(HeightPreferenceKey.self) { height in
                    if let height {
                        self.detentHeight = height
                    }
                }
                .frame(maxHeight: .infinity)
                .presentationDetents([.height(self.detentHeight)])
                .background(.lgLeaderboardHighlight)
                .interactiveDismissDisabled()
        }
    }
}

struct ImagelevelGeneration{
    var prompt: String
    var correctAnswer: String
}

#Preview {
    ImageLevelView(path: .constant([]), count: 0, selectedLevel: ImageLevelLibrary().levels[0], totalScore: .constant(0)
    )
}
