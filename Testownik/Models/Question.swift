import Foundation
import RealmSwift

class Question: Object {
    @Persisted var text: String
    @Persisted var imagePath: String?
    @Persisted var answers: List<Answer>
}
