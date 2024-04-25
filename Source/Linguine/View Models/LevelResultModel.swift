//
//  LevelResultModel.swift
//  Linguine (iOS)
//
//  Created by Matt Novoselov on 25/04/24.
//

import Foundation

// Construct levels for the level type: How Do You Say?
class LevelResultModel{
    let completionMessages: [String] = [
        "Great job!",
        "Well done!",
        "Awesome!",
        "Good work!",
        "Fantastic!",
        "Super!",
        "Nice job!",
        "Outstanding!",
        "Wonderful!",
        "Amazing!",
        "Superb!",
        "Impressive!",
        "Good going!",
        "Perfect!",
        "Excellent!",
    ]
    
    let incorrectMessages: [String] = [
        "Incorrect",
        "Oops, try next time",
        "Not quite right",
        "Uh-oh, that's not it",
        "Keep trying",
        "Wrong answer",
        "Almost there, but not quite",
        "Try again",
        "Not the correct solution",
        "Close, but not there yet",
        "Incorrect, give it another shot",
        "That's a miss",
        "Wrong move",
        "Not the right answer",
        "You'll get it next time",
        "Incorrect choice"
    ]
}
