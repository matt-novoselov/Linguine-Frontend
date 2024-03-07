import SwiftUI

struct MatchCardsLevelView: View {
    @State private var leftSelectedButtonIndex: Int?
    @State private var rightSelectedButtonIndex: Int?
    @State private var amountOfPairsFound: Int = 0
    @State var detentHeight: CGFloat = 0
    @Binding var path: [Int]
    let count: Int
    var selectedLevel: HDYSlevel
    @Binding var totalScore: Int
    @State private var amountOfPairs: Int
    private var leftArray: [HDYSlevelCard]
    private var rightArray: [HDYSlevelCard]
    
    init(path: Binding<[Int]>, count: Int, selectedLevel: HDYSlevel, totalScore: Binding<Int>) {
        self._path = path
        self.count = count
        self.selectedLevel = selectedLevel
        self._totalScore = totalScore
        self.amountOfPairs = selectedLevel.imageLevelCards.count
        self.leftArray = selectedLevel.imageLevelCards.shuffled()
        self.rightArray = selectedLevel.imageLevelCards.shuffled()
    }
    
    var body: some View {
        
        VStack{
            VStack(alignment: .leading ,spacing: 20){
                Text("Tap the matching pairs")
                    .font(Font.custom("DINNextRoundedLTPro-Bold", size: 24))
                    .accessibilitySortPriority(1)
                
                Spacer()
                
                HStack{
                    VStack{
                        ForEach(0..<amountOfPairs, id: \.self) { i in
                            cardButton(title: leftArray[i].english, action: {leftSelectedButtonIndex = leftSelectedButtonIndex == i ? nil : i}, style: leftSelectedButtonIndex==i ? .standart : .disabled)
                        }
                    }
                    
                    VStack{
                        ForEach(0..<amountOfPairs, id: \.self) { i in
                            cardButton(title: rightArray[i].italian, action: {rightSelectedButtonIndex = rightSelectedButtonIndex == i ? nil : i}, style: rightSelectedButtonIndex==i ? .standart : .disabled)
                        }
                    }
                }

                Spacer()
                
                dropButton(title: "continue", action: {}, style: amountOfPairsFound==amountOfPairs ? .standart : .disabled)
                    .padding(.bottom)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color.lgBackground.ignoresSafeArea())
        .sheet(isPresented: Binding(
            get: {
                return leftSelectedButtonIndex != nil && rightSelectedButtonIndex != nil
            },
            set: { _ in }
        )) {
            let isAnswerCorrect = isAnswerCorrect(correctAnswer: leftArray[leftSelectedButtonIndex!].english, selectedAnswer: rightArray[rightSelectedButtonIndex!].english)
            
            levelResult(correctAnswer: leftArray[leftSelectedButtonIndex!].english, showExplanation: false, action: {
                
                if isAnswerCorrect{
                    amountOfPairsFound+=1
                }
                
                leftSelectedButtonIndex = nil
                rightSelectedButtonIndex = nil
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
    MatchCardsLevelView(path: .constant([]), count: 0, selectedLevel: HDYSLevelLibrary().levels[0], totalScore: .constant(0)
    )
}
