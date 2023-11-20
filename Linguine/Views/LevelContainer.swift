import SwiftUI

struct LevelContainer: View {
    @State private var isShown: Bool = false
    @Binding var path: [Int]
    @State var count: Int
    var levels: [String]
    var selected_user: User
    @Binding var totalScore: Int
    
    
    var body: some View {
        VStack{            
            if path.count == levels.count && !isShown{
                LessonCompleteView(path: $path, selected_user: selected_user, totalScore: $totalScore)
            }
            else {
                LessonView(levelModel: LevelImageLibrary().levels[count], path: $path, count: count, levels: levels, totalScore: $totalScore)
                .onAppear(){
                    isShown.toggle()
                }
            }

        }
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}
