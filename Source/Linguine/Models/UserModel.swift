//
//
//
//
//
//

import SwiftUI
import JWTDecode

// Define a User struct to hold user information
struct User {
    let id: String
    let email: String
    let nickname: String
}

// Extend the User struct to initialize from a JWT token
extension User {
    init?(from idToken: String) {
        // Attempt to decode the JWT token
        guard let jwt = try? decode(jwt: idToken),
              // Extract user id from the JWT token's subject claim
              let id = jwt.subject,
              // Extract user email from the JWT token's email claim
              let email = jwt["email"].string,
              // Extract user nickname from the JWT token's nickname claim
              let nickname = jwt["nickname"].string
        else {
            // Return nil if any required information is missing or decoding fails
            return nil
        }
        // Initialize the User object with the extracted information
        self.id = id
        self.email = email
        self.nickname = nickname
    }
}

// Define a struct representing a single user with name and score
struct SingleUser: Decodable {
    let name: String
    let score: Int
}

// Define a struct representing a single user with a UUID identifier
struct UUIDSingleUser: Identifiable {
    var id = UUID() // Initialize the UUID identifier
    let name: String // User's name
    let score: Int // User's score
}

// Define a struct representing a user's score
struct Score: Decodable {
    let score: Int // User's score
}

// Define a struct representing a response containing statistics
struct StatsResponse: Decodable {
    let users: [SingleUser] // Array of users with name and score
}

