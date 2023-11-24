import SwiftUI

struct HDYSLevelView: View {
    @State private var selectedButtonIndex: Int?
    @State private var showingCredits = false
    @State var detentHeight: CGFloat = 0
    @Binding var path: [Int]
    let count: Int
    var selectedLevel: HDYSlevel
    @Binding var totalScore: Int
    
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
        
        VStack{
            VStack(alignment: .leading ,spacing: 20){
                Text("How do you say \"\(generatedLevel!.correctAnswer)\"?")
                    .font(Font.custom("DINNextRoundedLTPro-Bold", size: 24))
                    .accessibilitySortPriority(1)
                
                Spacer()
                
                ForEach(0..<selectedLevel.imageLevelCards.count, id: \.self) { i in
                    cardButton(title: selectedLevel.imageLevelCards[i].italian, action: {selectedButtonIndex=i}, style: selectedButtonIndex==i ? .standart : .disabled)
                }
                
                Spacer()
                
                dropButton(title: "check", action: {showingCredits.toggle()}, style: selectedButtonIndex != nil ? .standart : .disabled)
                    .padding(.bottom)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color.lgBackground.ignoresSafeArea())
        .sheet(isPresented: $showingCredits) {
            levelResult(correctAnswers: generatedLevel!.prompt, selectedAnswer: selectedLevel.imageLevelCards[selectedButtonIndex!].italian, path: $path, count: count, totalScore: $totalScore)
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
