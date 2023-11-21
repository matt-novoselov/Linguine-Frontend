import SwiftUI
import Auth0

struct LevelsSelectionView: View {
    // Amount of levels user has completed. Will be retrieved from the database in the future
    let levels_completed: Int = 3
    
    @Binding var user: User? //used for login and logout
    var selected_user: User //used to get info about user. Ex: name, email, uid and etc.
    
    @State var current_score: Int //users XP score, retrieved from the database
    @State var totalScore: Int = 0 //score earned from the last lesson

    let lessonLibrary: [Lesson] = LessonLibrary().lessons
    var wavePattern: [Int] = generateWavePattern(length: 12 + 1)
    
    @State var selectedLevelIndex: Int?
    @State private var path: [Int] = []
    
    
    func lesson_type(index:Int) -> Style {
        switch index {
        case levels_completed:
            return .standart
        case _ where index > levels_completed:
            return .disabled
        case _ where index < levels_completed:
            return .completed
        default:
            return .standart
        }
    }
    
    var body: some View {
        VStack{
            NavigationStack(path: $path) {
                VStack{
                    LevelsUpBar(action: self.logout, current_score: current_score)
                        .padding(.top)
                    
                    Text(selectedLevelIndex?.description ?? "No level selected").hidden().frame(width: 0,height: 0).frame( maxWidth: 0, maxHeight: 0)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading){
                            ForEach(Array(lessonLibrary.enumerated()), id: \.element.id) { index, lesson in
                                dropButtonRound(titleSymbol: lesson.sfSymbol, action: {
                                    selectedLevelIndex = index
                                    path.append(0)
                                    totalScore = 0
                                }, style: lesson_type(index: index))
                                .padding(.top)
                                .padding(.leading, CGFloat(wavePattern[index]))
                            }
                        }
                    }
                    .navigationDestination(for: Int.self) { int in
                        LevelContainer(path: $path, count: int, selected_level: lessonLibrary[selectedLevelIndex!], selected_user: selected_user, totalScore: $totalScore, current_score: $current_score)
                    }
                }
                .padding(.horizontal)
                .background(Color.lgBackground.ignoresSafeArea())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
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
    LevelsSelectionView(
        user: Bootstrap().$user,
        selected_user:
            User(
            id: "auth1|6552867564e79113efcb65f7",
            email: "example@gmail.com",
            nickname: "example"),
        current_score: 0
    )
}
