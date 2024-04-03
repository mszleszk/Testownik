import UIKit

struct QuestionPresentable {
    var text: String?
    var image: UIImage?
    var answers: [AnswerPresentable]
    var isMultipleChoice: Bool
}
