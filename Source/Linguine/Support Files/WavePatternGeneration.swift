//
//
//
//
//
//

import Foundation

// This function is used to generate the wave pattern for the level selection screen button positions
// Input: An amount of elements in the sequence
// Output: A sequence of values that stand for the padding from the leading side of the screen, that resemble a patter of the wave
func generateWavePattern(length: Int) -> [Int] {
    
    // Define the pattern for the wave
    // The given values stand for the padding from the leading side of the screen
    let pattern = [0, 25, 75, 125, 150, 125, 75, 25]
    
    // The start index for the wave.
    // Example: You can start generating the wave from the 7th element of the pattern, so the first element will be in the center
    let customStartIndex = 7
    
    // Count an amount of repeats for the pattern
    let count = (length + customStartIndex) / pattern.count + 1

    // Generate pattern based on the amount of repeats
    let repeatedPattern = Array(repeating: pattern, count: count).flatMap { $0 }
    
    // Define start and end indexes
    let startIndex = customStartIndex - 1
    let endIndex = length + startIndex - 1

    // Return a sequence of values that stand for the padding from the leading side of the screen, that resemble a patter of the wave
    return Array(repeatedPattern[startIndex..<endIndex])
}
