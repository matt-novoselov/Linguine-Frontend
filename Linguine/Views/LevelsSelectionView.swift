import SwiftUI
import Auth0

struct LevelsSelectionView: View {
    @Binding var user: User?
    @State private var current_score = 0
    var selected_user: User
    let levelsLibrary: [LevelImage] = LevelImageLibrary().levels
    let levels_completed: Int = 3
    var lessonBuilderModel: LessonBuilderModel = LessonBuilderModel()
    @State private var path: [Int] = []
    @State var totalScore: Int = 0
    @State var selectedLevelIndex: Int = 0
    
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

                    ScrollView() {
                        VStack(alignment: .leading){
                            ForEach(Array(levelsLibrary.enumerated()), id: \.element.id) { index, levels in
                                VStack{
                                    dropButtonRound(titleSymbol: levels.sfSymbol, action: {
                                        path.append(0)
                                        selectedLevelIndex = index
                                    }, style: lesson_type(index: index))
                                        .padding(.top)
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }.navigationDestination(for: Int.self) { int in
                        LevelContainer(path: $path, count: int, selected_level: lessonBuilderModel.lessons[selectedLevelIndex], selected_user: selected_user, totalScore: $totalScore)
                    }
                }
                .padding(.horizontal)
                .background(Color.lgBackground.ignoresSafeArea())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear(){
            Task {
                do {
                    current_score = try await get_score_by_id(user_id: selected_user.id)
                    print("Fetched score \(current_score)")
                } catch {
                    print(error)
                }
            }
        }
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
        selected_user: User(
            id: "auth1|6552867564e79113efcb65f7",
            email: "example@gmail.com",
            nickname: "example")
    )
}
