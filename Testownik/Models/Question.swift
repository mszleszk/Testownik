import Foundation
import RealmSwift

class Question: Object {
    @Persisted var text: String?
    @Persisted var imageName: String?
    @Persisted var answers: List<Answer>
    @Persisted var isCompleted = false
    
    convenience init(text: String? = nil, imageName: String? = nil, answers: List<Answer>) {
        self.init()
        self.text = text
        self.imageName = imageName
        self.answers = answers
    }
}
