import Foundation
import RealmSwift

class Test: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var name: String
    @Persisted var emoji: String
    @Persisted var questions: List<Question>
    @Persisted var imagesFolderName: String?
    
    convenience init(name: String, emoji: String, questions: List<Question>, imagesFolderName: String? = nil) {
        self.init()
        self.id = UUID().uuidString
        self.name = name
        self.emoji = emoji
        self.questions = questions
        self.imagesFolderName = imagesFolderName
    }
}
