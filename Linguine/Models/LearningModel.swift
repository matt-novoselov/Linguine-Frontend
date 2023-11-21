import Foundation

struct HDYSlevelCard{
    var english: String
    var italian: String
}

struct HDYSlevel{
    var imageLevelCards: [HDYSlevelCard]
}

struct ImagelevelCard{
    var lottie: String
    var english: String
    var italian: String
}

struct Imagelevel{
    var imageLevelCards: [ImagelevelCard]
}

struct Lesson: Identifiable{
    var id = UUID()
    var sfSymbol: String
    var levels: [Imagelevel]
}
