import Foundation

struct LevelImage {
    var prompt: String
    var correct_answer: String
    var variants: [LevelImageVariants]
}

struct LevelImageVariants {
    var title: String
    var icon_name: String

    init(title: String, icon_name: String? = nil) {
        self.title = title
        self.icon_name = (icon_name != nil) ? icon_name! : title.replacingOccurrences(of: " ", with: "_")
    }
}
