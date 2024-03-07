import SwiftUI

struct LessonContainer: View {
    @State private var isShown: Bool = false
    @Binding var path: [Int]
    @State var count: Int
    var selectedLesson: Lesson
    var selectedUser: User
    @Binding var totalScore: Int
    @Binding var currentScore: Int
    
    var body: some View {
        VStack{
            if path.count == selectedLesson.levels.count+1 && !isShown{
                LessonCompleteView(path: $path, selectedUser: selectedUser, totalScore: $totalScore, currentScore: $currentScore)
            }
            else {
                let selectedLevel = selectedLesson.levels[count<selectedLesson.levels.count ? count : 0]
                
                let percentProgress: Double = Double(Double(path.count - 1) / Double(selectedLesson.levels.count))

                VStack(alignment: .leading ,spacing: 20){
                    HStack{
                        Button(action:{path = []}){
                            Image(systemName: "xmark")
                                .font(.system(size: 28))
                                .fontWeight(.medium)
                                .foregroundColor(.lgDisabledTitle)
                                .accessibilityLabel("Exit level")
                                .accessibilitySortPriority(-1)
                        }
                        
                        LevelprogressBar(progress: percentProgress)
                        
                        Spacer()
                    }
                    .frame(maxHeight: 20)
                    .padding(.horizontal)
                    .padding(.top)
                    
                    Group{
                        switch selectedLevel.levelType {
                        case .imageLevel:
                            ImageLevelView(path: $path, count: count, selectedLevel: selectedLevel as! Imagelevel, totalScore: $totalScore)
                            
                        case .HDYSLevel:
                            HDYSLevelView(path: $path, count: count, selectedLevel: selectedLevel as! HDYSlevel, totalScore: $totalScore)
                            
                        case .SingleImageLevel:
                            SingleImageLevelView(path: $path, count: count, selectedLevel: selectedLevel as! Imagelevel, totalScore: $totalScore)
                        }
                    }
                }
                .background(Color.lgBackground.ignoresSafeArea())
                .onAppear(){
                    isShown.toggle()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    LessonContainer(path: .constant([0]), count: 0, selectedLesson: LessonLibrary().lessons[0], selectedUser:
                        User(
                            id: "auth1|6552867564e79113efcb65f7",
                            email: "example@gmail.com",
                            nickname: "example"
                        ),
    totalScore: .constant(0), currentScore: .constant(0))
}
