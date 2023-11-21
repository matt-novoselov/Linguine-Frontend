import SwiftUI

struct LessonContainer: View {
    @State private var isShown: Bool = false
    @Binding var path: [Int]
    @State var count: Int
    var selectedLevel: Lesson
    var selectedUser: User
    @Binding var totalScore: Int
    @Binding var currentScore: Int
    
    
    var body: some View {
        VStack{            
            if path.count == selectedLevel.levels.count+1 && !isShown{
                LessonCompleteView(path: $path, selectedUser: selectedUser, totalScore: $totalScore, currentScore: $currentScore)
            }
            else {
                ImageLevelView(path: $path, count: count, selectedLevel: selectedLevel.levels[count<selectedLevel.levels.count ? count : 0], totalScore: $totalScore)
                .onAppear(){
                    isShown.toggle()
                }
            }

        }
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}
