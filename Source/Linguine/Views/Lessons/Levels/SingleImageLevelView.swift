//
//
//
//
//
//

import SwiftUI

// Single image level shows you an image and it's name in English
// The user's goal is to input the correct translation of the item presented in the image
struct SingleImageLevelView: View {
    
    @State private var showingCredits = false
    @State var detentHeight: CGFloat = 0
    @Binding var path: [Int]
    let count: Int
    var selectedLevel: Imagelevel
    @Binding var totalScore: Int
    @State private var inputFieldText: String = ""
    @FocusState var isFocused : Bool
    
    // Initialize all properties
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
        
        VStack(spacing: 20){
            
            // Main image view
            VStack(spacing: 20){
                UILottieView(lottieName: randomImageLevelCard!.lottie, playOnce: true)
                    .frame(height: 100)
                
                Text(randomImageLevelCard!.english)
                    .font(Font.custom("DINNextRoundedLTPro-Regular", size: 20))
                    .accessibilitySortPriority(1)
                    .accessibilityLabel("Type in italian: \(randomImageLevelCard!.english)")
            }
            .frame(width: 180, height: 180)
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.lgDisabledButton, lineWidth: 2)
            }
            
            // Text field to input an answer
            TextField(
                "Type in Italian",
                text: $inputFieldText
            )
            .focused($isFocused)
            .textFieldStyle(WhiteBorder())
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .onTapGesture {
                isFocused = true
            }
            
            // Button to check the answer
            DropButton(title: "check", action: {showingCredits.toggle(); isFocused = false}, style: inputFieldText != "" ? .standard : .disabled)
                .padding(.bottom)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.lgBackground)
        
        
        // Disable keyboard on tap gesture
        .onTapGesture {
            hideKeyboard()
        }
        
        // Present sheet after user submitted an answer
        .sheet(isPresented: $showingCredits) {
            let isAnswerCorrect = isAnswerCorrect(correctAnswer: randomImageLevelCard!.italian, selectedAnswer: inputFieldText.lowercased())
            
            LevelResult(correctAnswer: randomImageLevelCard!.italian, action: {
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
    SingleImageLevelView(path: .constant([]), count: 0, selectedLevel: ImageLevelLibrary().levels[0], totalScore: .constant(0)
    )
}
