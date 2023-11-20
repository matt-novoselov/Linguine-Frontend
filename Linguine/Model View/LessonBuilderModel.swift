import Foundation

class LessonBuilderModel {
    var lib: [LevelImage]
    
    var lessons: [[LevelImage]]

    init() {
        self.lib = LevelImageLibrary().levels
        self.lessons = [
            [lib[0], lib[1], lib[2],      lib[0]],
            [lib[3], lib[4], lib[5],      lib[0]],
            [lib[6], lib[7], lib[8],      lib[0]],
            [lib[9], lib[10], lib[11],      lib[0]],
        ]
    }
}
