//
//
//
//
//
//

import SwiftUI
import Auth0

struct MenuView: View {
    
    // Amount of levels user has completed. Will be retrieved from the database in the future
    let levelsCompleted: Int = 6
    
    // Used to store login information about the user
    @Binding var user: User?
    
    // Used to get information about user. Ex: name, email, uid and etc.
    var selectedUser: User
    
    // Users XP score, retrieved from the database
    @State var currentScore: Int
    
    // Score earned from the last lesson
    @State var totalScore: Int = 0
    
    // Load all lessons form the library
    let lessonLibrary: [Lesson] = LessonLibrary().lessons
    
    // Generate wave patterns for the level buttons
    var wavePattern: [Int] = generateWavePattern(length: 13)
    
    // The index of the level that user selects
    @State var selectedLevelIndex: Int?
    
    // Generate the path for the lesson
    @State private var path: [Int] = []
    
    // Define the style of the button based on the state of the lesson
    func lessonType(index:Int) -> Style {
        switch index {
        case levelsCompleted:
            return .standard
        case _ where index > levelsCompleted:
            return .disabled
        case _ where index < levelsCompleted:
            return .completed
        default:
            return .standard
        }
    }
    
    var body: some View {

        NavigationStack(path: $path) {
            VStack {
                LevelsUpBar(logOutAction: self.logout, currentScore: currentScore)
                    .padding(.top)
                
                // This hidden text is needed to keep track of the selectedLevelIndex variable
                Text(selectedLevelIndex?.description ?? "No level selected")
                    .hidden()
                    .frame(width: 0, height: 0)
                
                // Scrollable list of lesson buttons
                ScrollView {
                    VStack(alignment: .leading) {
                        // Iterate through lessonLibrary to display buttons for each lesson
                        ForEach(Array(lessonLibrary.enumerated()), id: \.element.id) { index, lesson in

                            DropButtonRound(titleSymbol: lesson.sfSymbol, action: {
                                // Set selectedLevelIndex to the index of the selected lesson
                                selectedLevelIndex = index
                                path.append(0)
                                
                                // Reset totalScore to 0 when a new lesson is selected
                                totalScore = 0
                            }, style: lessonType(index: index))
                            .padding(.top)
                            .padding(.leading, CGFloat(wavePattern[index]))
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                // Define navigation destination for lesson container view
                .navigationDestination(for: Int.self) { int in
                    // Render LessonContainer view with necessary parameters
                    LessonContainer(path: $path, count: int, selectedLesson: lessonLibrary[selectedLevelIndex!], selectedUser: selectedUser, totalScore: $totalScore, currentScore: $currentScore)
                }
            }
            .padding(.horizontal)
            .background(.lgBackground)
        }
    }
    
    // Function that logs user out of the app
    func logout() {
        let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
        
        Auth0
            .webAuth()
            .clearSession { result in
                switch result {
                case .success:
                    _ = credentialsManager.clear()
                    self.user = nil
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
}

#Preview {
    MenuView(
        user: ContentView().$user,
        selectedUser:
            User(
                id: "auth1|6552867564e79113efcb65f7",
                email: "example@gmail.com",
                nickname: "example"),
        currentScore: 0
    )
}
