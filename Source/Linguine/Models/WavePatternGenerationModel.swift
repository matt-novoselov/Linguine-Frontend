import Foundation

func generateWavePattern(length: Int) -> [Int] {
    let M = [0, 25, 75, 125, 150, 125, 75, 25]
    let customStartIndex = 7
    let count = (length + customStartIndex) / M.count + 1

    let repeatedM = Array(repeating: M, count: count).flatMap { $0 }
    let startIndex = customStartIndex - 1
    let endIndex = length + startIndex - 1

    return Array(repeatedM[startIndex..<endIndex])
}
