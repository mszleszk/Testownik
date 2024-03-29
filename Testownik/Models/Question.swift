import Foundation
import RealmSwift

class Question: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var text: String?
    @Persisted var imageName: String?
    @Persisted var answers: List<Answer>
    @Persisted var isCompleted = false
    
    convenience init(text: String? = nil, imageName: String? = nil, answers: List<Answer>) {
        self.init()
        self.id = UUID().uuidString
        self.text = text
        self.imageName = imageName
        self.answers = answers
    }
}
