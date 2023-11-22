import SwiftUI
import Auth0

struct MenuView: View {
    // Amount of levels user has completed. Will be retrieved from the database in the future
    let levelsCompleted: Int = 6
    
    @Binding var user: User? //used for login and logout
    var selectedUser: User //used to get info about user. Ex: name, email, uid and etc.
    
    @State var currentScore: Int //users XP score, retrieved from the database
    @State var totalScore: Int = 0 //score earned from the last lesson
    
    let lessonLibrary: [Lesson] = LessonLibrary().lessons
    var wavePattern: [Int] = generateWavePattern(length: 12 + 1)
    
    @State var selectedLevelIndex: Int?
    @State private var path: [Int] = []
    
    
    func lessonType(index:Int) -> Style {
        switch index {
        case levelsCompleted:
            return .standart
        case _ where index > levelsCompleted:
            return .disabled
        case _ where index < levelsCompleted:
            return .completed
        default:
            return .standart
        }
    }
    
    var body: some View {
        VStack{
            NavigationStack(path: $path) {
                VStack{
                    LevelsUpBar(action: self.logout, currentScore: currentScore)
                        .padding(.top)
                    
                    Text(selectedLevelIndex?.description ?? "No level selected").hidden().frame(width: 0,height: 0).frame( maxWidth: 0, maxHeight: 0)
                    
                    ScrollView() {
                        Spacer()
                            .frame(height: levelsCompleted==0 ? 40 : 0)
                        
                        VStack(alignment: .leading){
                            ForEach(Array(lessonLibrary.enumerated()), id: \.element.id) { index, lesson in
                                dropButtonRound(titleSymbol: lesson.sfSymbol, action: {
                                    selectedLevelIndex = index
                                    path.append(0)
                                    totalScore = 0
                                }, style: lessonType(index: index))
                                .padding(.top)
                                .padding(.leading, CGFloat(wavePattern[index]))
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .navigationDestination(for: Int.self) { int in
                        LessonContainer(path: $path, count: int, selectedLesson: lessonLibrary[selectedLevelIndex!], selectedUser: selectedUser, totalScore: $totalScore, currentScore: $currentScore)
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
    MenuView(
        user: Bootstrap().$user,
        selectedUser:
            User(
                id: "auth1|6552867564e79113efcb65f7",
                email: "example@gmail.com",
                nickname: "example"),
        currentScore: 0
    )
}
