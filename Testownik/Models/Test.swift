import Foundation
import RealmSwift

class Test: Object {
    @Persisted var name: String
    @Persisted var emoji: String
    @Persisted var questions: List<Question>
    @Persisted var imagesFolderName: String?
    
    convenience init(name: String, emoji: String, questions: List<Question>, imagesFolderName: String? = nil) {
        self.init()
        self.name = name
        self.emoji = emoji
        self.questions = questions
        self.imagesFolderName = imagesFolderName
    }
}
