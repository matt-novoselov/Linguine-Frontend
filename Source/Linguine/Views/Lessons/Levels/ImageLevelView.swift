//
//
//
//
//
//

import SwiftUI

// Single image level shows you 4 images and their names in English
// The user's goal is to select the correct image that represents the item in Italian
struct ImageLevelView: View {
    
    @State private var selectedButtonIndex: Int?
    @State private var showingCredits = false
    @State var detentHeight: CGFloat = 0
    @Binding var path: [Int]
    let count: Int
    var selectedLevel: Imagelevel
    @Binding var totalScore: Int
    
    // Initialize all properties
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
        
        VStack(alignment: .leading ,spacing: 20){
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
                    CardButton(title: selectedLevel.imageLevelCards[i].english, iconName: selectedLevel.imageLevelCards[i].lottie, action: {selectedButtonIndex=i}, style: selectedButtonIndex==i ? .standard : .disabled)
                }
            }
            
            HStack(spacing: 20){
                ForEach((amountOfMenus  + 1) / 2..<amountOfMenus, id: \.self) { i in
                    CardButton(title: selectedLevel.imageLevelCards[i].english, iconName: selectedLevel.imageLevelCards[i].lottie, action: {selectedButtonIndex=i}, style: selectedButtonIndex==i ? .standard : .disabled)
                }
            }
            
            DropButton(title: "check", action: {showingCredits.toggle()}, style: selectedButtonIndex != nil ? .standard : .disabled)
                .padding(.bottom)
        }
        .padding(.horizontal)
        .background(.lgBackground)
        
        // Present sheet after user submitted an answer
        .sheet(isPresented: $showingCredits) {
            let isAnswerCorrect = isAnswerCorrect(correctAnswer: generatedLevel!.correctAnswer, selectedAnswer: selectedLevel.imageLevelCards[selectedButtonIndex!].english)
            
            LevelResult(correctAnswer: generatedLevel!.correctAnswer, action: {
                if isAnswerCorrect{
                    totalScore+=20
                }
                path.append(count + 1)
            }, isCorrect: isAnswerCorrect)
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
