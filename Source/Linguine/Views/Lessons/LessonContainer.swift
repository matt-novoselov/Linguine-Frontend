//
//
//
//
//
//

import SwiftUI

// LessonContainer manages the display of different types of lessons
struct LessonContainer: View {
    
    // State variable to track if the lesson completion view is shown
    @State private var isShown: Bool = false
    
    // Binding to the path array, which represents the user's progress in the lesson
    @Binding var path: [Int]
    
    // Variable to keep track of the current level count
    @State var count: Int
    
    // The selected lesson
    var selectedLesson: Lesson
    
    // The selected user
    var selectedUser: User
    
    // Binding to the total score earned by the user
    @Binding var totalScore: Int
    
    // Binding to the current score earned in the current lesson
    @Binding var currentScore: Int
    
    var body: some View {
        VStack{
            // Display the lesson completion view if all levels are completed
            if path.count == selectedLesson.levels.count+1 && !isShown{
                LessonCompleteView(path: $path, selectedUser: selectedUser, totalScore: $totalScore, currentScore: $currentScore)
            }
            else {
                // Determine the selected level based on the count
                let selectedLevel = selectedLesson.levels[count < selectedLesson.levels.count ? count : 0]
                
                // Calculate the percentage progress of the user in the lesson
                let percentProgress: Double = Double(Double(path.count - 1) / Double(selectedLesson.levels.count))

                VStack(alignment: .leading ,spacing: 20){
                    HStack{
                        // Button to exit the current level
                        Button(action:{path = []}){
                            Image(systemName: "xmark")
                                .font(.system(size: 28))
                                .fontWeight(.medium)
                                .foregroundColor(.lgDisabledTitle)
                                .accessibilityLabel("Exit level")
                                .accessibilitySortPriority(-1)
                        }
                        
                        // Display the level progress bar
                        LevelProgressBar(progress: percentProgress)
                        
                        Spacer()
                    }
                    .frame(maxHeight: 20)
                    .padding(.horizontal)
                    .padding(.top)
                    
                    Group{
                        // Display different views based on the type of level
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
                .background(.lgBackground)
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
