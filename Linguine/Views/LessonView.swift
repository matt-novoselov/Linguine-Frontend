import SwiftUI

struct LessonView: View {
    var levelModel: LevelImage
    @State private var selectedButtonIndex: Int?
    @State private var showingCredits = false
    @State var detentHeight: CGFloat = 0
    
    var body: some View {
        let amountOfMenus = levelModel.variants.count
        
        VStack{
            VStack(alignment: .leading ,spacing: 20){
                Image(systemName: "xmark")
                    .font(.system(size: 30))
                    .fontWeight(.medium)
                    .foregroundColor(.lgDisabledTitle)
                    .padding(.top)
                
                Text("Select the correct image")
                    .font(Font.custom("DINNextRoundedLTPro-Bold", size: 24))
                
                Text(levelModel.prompt)
                    .font(Font.custom("DINNextRoundedLTPro-Medium", size: 20))
                    .foregroundColor(.lgPinkButton)
                    .underline()
                
                HStack(spacing: 20){
                    ForEach(0..<(amountOfMenus  + 1) / 2, id: \.self) { i in
                        cardButton(title: levelModel.variants[i].title, icon_name: levelModel.variants[i].icon_name, action: {selectedButtonIndex=i}, style: selectedButtonIndex==i ? .standart : .disabled)
                    }
                }
                
                HStack(spacing: 20){
                    ForEach((amountOfMenus  + 1) / 2..<amountOfMenus, id: \.self) { i in
                        cardButton(title: levelModel.variants[i].title, icon_name: levelModel.variants[i].icon_name, action: {selectedButtonIndex=i}, style: selectedButtonIndex==i ? .standart : .disabled)
                    }
                }
                
                dropButton(title: "check", action: {showingCredits.toggle()}, style: selectedButtonIndex != nil ? .standart : .disabled)
                .padding(.bottom)
            }
            .padding(.horizontal)
        }
        .background(Color.lgBackground.ignoresSafeArea())
        .sheet(isPresented: $showingCredits) {
            levelResult(correctAnswers: levelModel.correct_answer, selectedAnswer: levelModel.variants[selectedButtonIndex!].title)
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
    LessonView(levelModel: LevelImageLibrary().levels[0])
}
