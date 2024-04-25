//
//
//
//
//
//

import Foundation

// Level is a sub category of a lesson
// Each lesson is composed of sequence of levels
protocol Level {
    var levelType: LevelType { get }
}

// Each lesson is composed of sequence of levels
struct Lesson: Identifiable{
    var id = UUID()
    
    // SF Icon for the menu button
    var sfSymbol: String
    
    // Levels of different type can be stored here
    var levels: [Level]
}

// Construct for level of type: Image Level
struct ImagelevelCard{
    
    // Name of the lottie file that represents the image
    var lottie: String
    
    // English name of the object on the image
    var english: String
    
    // Italian name of the object on the image
    var italian: String
}

// Construct for level of type: How Do You Say? Level
struct HDYSlevelCard{
    // English name of the object on the image
    var english: String
    
    // Italian name of the object on the image
    var italian: String
}

// Construct for level of type: Image Level
struct Imagelevel: Level {
    var imageLevelCards: [ImagelevelCard]
    var levelType: LevelType
}

// Construct for level of type: How Do You Say? Level
struct HDYSlevel: Level {
    var imageLevelCards: [HDYSlevelCard]
    var levelType: LevelType
}

// Construct for level of type: Single Image Level
struct SingleImagelevel: Level {
    var imageLevelCards: [ImagelevelCard]
    var levelType: LevelType
}
