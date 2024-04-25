//
//
//
//
//
//

import Foundation

// This function compares user answer with correct answer and returns Bool
// False - users's answer is incorrect
// True  - users's answer is correct
// The process of comparison ignores whitespaces
public func isAnswerCorrect(correctAnswer: String, selectedAnswer: String) -> Bool{
    return correctAnswer.trimmingCharacters(in: .whitespaces) == selectedAnswer.trimmingCharacters(in: .whitespaces)
}
