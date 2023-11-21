import SwiftUI

struct ImageLevelView: View {
    @State private var selectedButtonIndex: Int?
    @State private var showingCredits = false
    @State var detentHeight: CGFloat = 0
    @Binding var path: [Int]
    let count: Int
    var selected_level: Imagelevel
    @Binding var totalScore: Int
    
    init(path: Binding<[Int]>, count: Int, selected_level: Imagelevel, totalScore: Binding<Int>) {
        self._path = path
        self.count = count
        self.selected_level = selected_level
        self._totalScore = totalScore
        
        // Initialize properties here
        let randomImageLevelCard = selected_level.imageLevelCards.randomElement()
        let generatedLevel = ImagelevelGeneration(prompt: randomImageLevelCard?.italian ?? "", correct_answer: randomImageLevelCard?.english ?? "")
        _randomImageLevelCard = State(initialValue: randomImageLevelCard)
        _generatedLevel = State(initialValue: generatedLevel)
    }
    
    @State private var randomImageLevelCard: ImagelevelCard?
    @State private var generatedLevel: ImagelevelGeneration?
    
    var body: some View {
        let amountOfMenus: Int = selected_level.imageLevelCards.count
        
        VStack{
            VStack(alignment: .leading ,spacing: 20){
                Button(action:{path = []}){
                    Image(systemName: "xmark")
                        .font(.system(size: 30))
                        .fontWeight(.medium)
                        .foregroundColor(.lgDisabledTitle)
                        .padding(.top)
                }
                
                Text("Select the correct image")
                    .font(Font.custom("DINNextRoundedLTPro-Bold", size: 24))
                
                Text(generatedLevel!.prompt)
                    .font(Font.custom("DINNextRoundedLTPro-Medium", size: 20))
                    .foregroundColor(.lgPinkButton)
                    .underline()
                
                HStack(spacing: 20){
                    ForEach(0..<(amountOfMenus  + 1) / 2, id: \.self) { i in
                        cardButton(title: selected_level.imageLevelCards[i].english, icon_name: selected_level.imageLevelCards[i].lottie, action: {selectedButtonIndex=i}, style: selectedButtonIndex==i ? .standart : .disabled)
                    }
                }
                
                HStack(spacing: 20){
                    ForEach((amountOfMenus  + 1) / 2..<amountOfMenus, id: \.self) { i in
                        cardButton(title: selected_level.imageLevelCards[i].english, icon_name: selected_level.imageLevelCards[i].lottie, action: {selectedButtonIndex=i}, style: selectedButtonIndex==i ? .standart : .disabled)
                    }
                }
                
                dropButton(title: "check", action: {showingCredits.toggle()}, style: selectedButtonIndex != nil ? .standart : .disabled)
                    .padding(.bottom)
            }
            .padding(.horizontal)
        }
        .background(Color.lgBackground.ignoresSafeArea())
        .sheet(isPresented: $showingCredits) {
            levelResult(correctAnswers: generatedLevel!.correct_answer, selectedAnswer: selected_level.imageLevelCards[selectedButtonIndex!].english, path: $path, count: count, totalScore: $totalScore)
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

struct ImagelevelGeneration{
    var prompt: String
    var correct_answer: String
}

#Preview {
    ImageLevelView(path: .constant([]), count: 0, selected_level:             Imagelevel(imageLevelCards:
                                                                                            [
                                                                                                ImagelevelCard(lottie: "pizza", english: "pizza", italian: "pizza"),
                                                                                                ImagelevelCard(lottie: "tomato", english: "tomato", italian: "pomodoro"),
                                                                                                ImagelevelCard(lottie: "ice_cream", english: "ice cream", italian: "gelato"),
                                                                                                ImagelevelCard(lottie: "watermelon", english: "watermelon", italian: "anguria"),
                                                                                            ]
                                                                                        ),
                   totalScore: .constant(0)
    )
}
