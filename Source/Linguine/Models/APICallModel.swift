import Foundation

func getScoreById(userId: String) async throws -> Int {
    struct Score: Decodable {
        let score: Int
    }
    
    let url = URL(string: "https://mattapi.fun/get_score/\(userId)")!
    let (data, _) = try await URLSession.shared.data(from: url)
    let decoded = try JSONDecoder().decode(Score.self, from: data)

    return decoded.score
}

struct SingleUser: Decodable {
    let name: String
    let score: Int
}

struct UUIDSingleUser: Identifiable {
    var id = UUID()
    let name: String
    let score: Int
}

func getStats() async throws -> [UUIDSingleUser] {
    struct StatsResponse: Decodable {
        let users: [SingleUser]
    }
    
    let url = URL(string: "https://mattapi.fun/get_stats")!
    let (data, _) = try await URLSession.shared.data(from: url)
    let decoded = try JSONDecoder().decode(StatsResponse.self, from: data)
    
    let arrayOfType2: [UUIDSingleUser] = decoded.users.map { type1Instance in
        return UUIDSingleUser(name: type1Instance.name, score: type1Instance.score)
    }
    
    return arrayOfType2
}

func updateScoreById(userId: String, newScore: Int) async throws -> Int {
    struct Score: Decodable {
        let score: Int
    }
    
    let url = URL(string: "https://mattapi.fun/update_score/\(userId)/\(newScore)")!
    
    let (data, _) = try await URLSession.shared.data(from: url)
    let decoded = try JSONDecoder().decode(Score.self, from: data)
    
    return decoded.score
}

func addUserToDatabase(userId: String, nickname: String) async throws {

    let url = URL(string: "https://mattapi.fun/add_user/\(userId)/\(nickname)")!
    _ = try await URLSession.shared.data(from: url)
}
