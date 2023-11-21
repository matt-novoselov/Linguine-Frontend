import Foundation

struct Lesson: Identifiable{
    var id = UUID()
    var sfSymbol: String
    var levels: [Level]
}

protocol Level {
    var levelType: LevelType { get }
    // Add any other common properties or methods here
}

struct ImagelevelCard{
    var lottie: String
    var english: String
    var italian: String
}

struct Imagelevel: Level {
    var imageLevelCards: [ImagelevelCard]
    var levelType: LevelType
}

struct HDYSlevelCard{
    var english: String
    var italian: String
}

struct HDYSlevel: Level {
    var imageLevelCards: [HDYSlevelCard]
    var levelType: LevelType
}
