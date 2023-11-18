import SwiftUI
import Auth0

struct LevelsSelectionView: View {
    @Binding var user: User?
    @State private var current_score = 0
    var selected_user: User
    var levelsLibrary: [LevelImage] = LevelImageLibrary().levels
    let levels_completed: Int = 3
    let wavePattern = generateWavePattern(length: 13)
    
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
            VStack{
                LevelsUpBar(action: self.logout, current_score: current_score)
                    .padding(.top)
                
                ScrollView() {
                    VStack(alignment: .leading){
                        ForEach(Array(levelsLibrary.enumerated()), id: \.element.id) { index, levels in
                            VStack{
                                dropButtonRound(titleSymbol: "star.fill", action: {print("test_tap")}, style: lesson_type(index: index))
                                    .padding(.top)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                
            }.padding(.horizontal)
        }
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.lgBackground.ignoresSafeArea())
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
