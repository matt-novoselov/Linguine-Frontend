import Foundation

func get_score_by_id(user_id: String) async throws -> Int {
    struct Score: Decodable {
        let score: Int
    }
    
    let url = URL(string: "https://mattapi.fun/get_score/\(user_id)")!
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

func get_stats() async throws -> [UUIDSingleUser] {
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

func update_score_by_id(user_id: String, new_score: Int) async throws -> Int {
    struct Score: Decodable {
        let score: Int
    }
    
    let url = URL(string: "https://mattapi.fun/update_score/\(user_id)/\(new_score)")!
    
    let (data, _) = try await URLSession.shared.data(from: url)
    let decoded = try JSONDecoder().decode(Score.self, from: data)
    
    return decoded.score
}

func add_user_to_database(user_id: String, nickname: String) async throws {

    let url = URL(string: "https://mattapi.fun/add_user/\(user_id)/\(nickname)")!
    _ = try await URLSession.shared.data(from: url)
}
