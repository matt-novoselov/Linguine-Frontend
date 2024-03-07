import Foundation

func isAnswerCorrect(correctAnswer: String, selectedAnswer: String) -> Bool{
    return correctAnswer.trimmingCharacters(in: .whitespaces) == selectedAnswer.trimmingCharacters(in: .whitespaces)
}
