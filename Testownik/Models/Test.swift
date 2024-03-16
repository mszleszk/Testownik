import Foundation
import RealmSwift

class Test: Object {
    @Persisted var name: String
    @Persisted var emoji: String
    @Persisted var questions: List<Question>
    @Persisted var imagesFolderPath: String?
    
    convenience init(name: String, emoji: String, questions: List<Question>, imagesFolderPath: String? = nil) {
        self.init()
        self.name = name
        self.emoji = emoji
        self.questions = questions
        self.imagesFolderPath = imagesFolderPath
    }
}
