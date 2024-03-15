import Foundation
import RealmSwift

class Answer: Object{
    @Persisted var text: String
    @Persisted var imagePath: String?
    @Persisted var isCorrect: Bool
}
