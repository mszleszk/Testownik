import UIKit

struct AnswerPresentable {
    var text: String?
    var image: UIImage?
    var state: AnswerState
}

enum AnswerState {
    case normal
    case correct
    case incorrect
}
