import Foundation
import SwiftUI

class leaderboardTemplate{
    var listOfUsers:[UUIDSingleUser] = []
    
    init() {
        for _ in 0..<8 {
            let newUser = UUIDSingleUser(name: String(repeating: "a", count: Int.random(in: 5..<12)), score: Int.random(in: 0..<1000))
            listOfUsers.append(newUser)
        }
    }
}
