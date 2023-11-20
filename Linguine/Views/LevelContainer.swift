import SwiftUI

struct LevelContainer: View {
    @State private var isShown: Bool = false
    @Binding var path: [Int]
    @State var count: Int
    var selected_level: [LevelImage]
    var selected_user: User
    @Binding var totalScore: Int
    
    
    var body: some View {
        VStack{            
            if path.count == selected_level.count && !isShown{
                LessonCompleteView(path: $path, selected_user: selected_user, totalScore: $totalScore)
            }
            else {
                LessonView(levelModel: selected_level[count], path: $path, count: count, selected_level: selected_level, totalScore: $totalScore)
                .onAppear(){
                    isShown.toggle()
                }
            }

        }
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}
