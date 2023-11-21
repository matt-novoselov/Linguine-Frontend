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
                .onAppear(){
                    isShown.toggle()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}
