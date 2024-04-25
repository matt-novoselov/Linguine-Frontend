//
//
//
//
//
//

import SwiftUI

// Single image level shows you an english word and X variants of the word translation
// The user's goal is to select the correct translation of the word
struct HDYSLevelView: View {
    
    @State private var selectedButtonIndex: Int?
    @State private var showingCredits = false
    @State var detentHeight: CGFloat = 0
    @Binding var path: [Int]
    let count: Int
    var selectedLevel: HDYSlevel
    @Binding var totalScore: Int
    
    // Initialize all properties
    init(path: Binding<[Int]>, count: Int, selectedLevel: HDYSlevel, totalScore: Binding<Int>) {
        self._path = path
        self.count = count
        self.selectedLevel = selectedLevel
        self._totalScore = totalScore
        
        let randomHDYSLevelCard = selectedLevel.imageLevelCards.randomElement()
        let generatedLevel = ImagelevelGeneration(prompt: randomHDYSLevelCard?.italian ?? "", correctAnswer: randomHDYSLevelCard?.english ?? "")
        _randomHDYSLevelCard = State(initialValue: randomHDYSLevelCard)
        _generatedLevel = State(initialValue: generatedLevel)
    }
    
    @State private var randomHDYSLevelCard: HDYSlevelCard?
    @State private var generatedLevel: ImagelevelGeneration?
    
    var body: some View {
        
        VStack(alignment: .leading ,spacing: 20){
            Text("How do you say \"\(generatedLevel!.correctAnswer)\"?")
                .font(Font.custom("DINNextRoundedLTPro-Bold", size: 24))
                .accessibilitySortPriority(1)
            
            Spacer()
            
            ForEach(0..<selectedLevel.imageLevelCards.count, id: \.self) { i in
                CardButton(title: selectedLevel.imageLevelCards[i].italian, action: {selectedButtonIndex=i}, style: selectedButtonIndex==i ? .standard : .disabled)
            }
            
            Spacer()
            
            DropButton(title: "check", action: {showingCredits.toggle()}, style: selectedButtonIndex != nil ? .standard : .disabled)
                .padding(.bottom)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.lgBackground)
        
        // Present sheet after user submitted an answer
        .sheet(isPresented: $showingCredits) {
            let isAnswerCorrect = isAnswerCorrect(correctAnswer: generatedLevel!.prompt, selectedAnswer: selectedLevel.imageLevelCards[selectedButtonIndex!].italian)
            
            LevelResult(correctAnswer: generatedLevel!.prompt, action: {
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

#Preview {
    HDYSLevelView(path: .constant([]), count: 0, selectedLevel: HDYSLevelLibrary().levels[0], totalScore: .constant(0)
    )
}
