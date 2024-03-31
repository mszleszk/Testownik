import UIKit

struct QuestionPresentable {
    var id: String
    var text: String?
    var image: UIImage?
    var answers: [AnswerPresentable]
    var isMultipleChoice: Bool
}
