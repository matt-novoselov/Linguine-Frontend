//
//
//
//
//
//

import Foundation

// This file contain all API calls that are being performed in the app
// Note: The app is making requests to the API endpoint on https://mattapi.fun
// You can build and run your own backend server.
// Source code and instructions on how to build your own FastAPI linguine backend server: https://github.com/matt-novoselov/Linguine-backend

// The full documentation for the API is available here: https://mattapi.fun/docs

// Make sure to replace the api domain to your actual endpoint
let apiEndPoint: String = "https://mattapi.fun"



// MARK: Get Score By ID
// Documentation: https://mattapi.fun/docs#/default/get_score_get_score__user_id__get
// Function that returns a score of a particular User by the User ID
func getScoreById(userId: String) async throws -> Int {
    // Construct the URL for retrieving the user's score using the API endpoint and user ID
    let url = URL(string: "\(apiEndPoint)/get_score/\(userId)")!
    
    // Perform an asynchronous network request to fetch data from the URL
    let (data, _) = try await URLSession.shared.data(from: url)
    
    // Decode the retrieved JSON data into a Score object using JSONDecoder
    let decoded = try JSONDecoder().decode(Score.self, from: data)

    // Return the score extracted from the decoded Score object
    return decoded.score
}


// MARK: Get Statistics
// Documentation: https://mattapi.fun/docs#/default/get_stats_get_stats_get
func getStats() async throws -> [UUIDSingleUser] {
    // Construct the URL for retrieving statistics using the API endpoint
    let url = URL(string: "\(apiEndPoint)/get_stats")!
    
    // Perform an asynchronous network request to fetch data from the URL
    let (data, _) = try await URLSession.shared.data(from: url)
    
    // Decode the retrieved JSON data into a StatsResponse object using JSONDecoder
    let decoded = try JSONDecoder().decode(StatsResponse.self, from: data)
    
    // Map the decoded users from StatsResponse into an array of UUIDSingleUser objects
    let arrayOfScores: [UUIDSingleUser] = decoded.users.map { type1Instance in
        // Create a UUIDSingleUser object from each user in the decoded data
        return UUIDSingleUser(name: type1Instance.name, score: type1Instance.score)
    }
    
    // Return the array of UUIDSingleUser objects
    return arrayOfScores
}


// MARK: Update Score by User ID
// Documentation: https://mattapi.fun/docs#/default/update_score_update_score__user_id___amount__get
func updateScoreById(userId: String, newScore: Int) async throws -> Int {
    // Construct the URL for updating the user's score using the API endpoint, user ID, and new score
    let url = URL(string: "\(apiEndPoint)/update_score/\(userId)/\(newScore)")!
    
    // Perform an asynchronous network request to update the user's score
    let (data, _) = try await URLSession.shared.data(from: url)
    
    // Decode the retrieved JSON data into a Score object using JSONDecoder
    let decoded = try JSONDecoder().decode(Score.self, from: data)
    
    // Return the updated score extracted from the decoded Score object
    return decoded.score
}


// MARK: Add User to the Database
// Documentation: https://mattapi.fun/docs#/default/add_user_add_user__user_id___nickname__get
func addUserToDatabase(userId: String, nickname: String) async throws {
    // Construct the URL for adding a user to the database using the API endpoint, user ID, and nickname
    let url = URL(string: "\(apiEndPoint)/add_user/\(userId)/\(nickname)")!
    
    // Perform an asynchronous network request to add the user to the database
    _ = try await URLSession.shared.data(from: url)
}
