import Foundation
import RealmSwift

class Answer: Object{
    @Persisted var text: String?
    @Persisted var imageName: String?
    @Persisted var isCorrect: Bool
    
    convenience init(text: String? = nil, imageName: String? = nil, isCorrect: Bool) {
        self.init()
        self.text = text
        self.imageName = imageName
        self.isCorrect = isCorrect
    }
}
