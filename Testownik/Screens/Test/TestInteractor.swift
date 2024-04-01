import UIKit
import RealmSwift

protocol TestInteractorLogic {
    func getNextQuestion()
}

final class TestInteractor {
    private let presenter: TestPresenterLogic
    private let imagesWorker = ImageFilesWorker()
    private var imagesFolderName: String?
    private let uncompletedQuestions: [Question]
    private var shuffledAnswers = Array<Answer>()
    private let totalQuestions: Int
    private var index = 0
    private var completedQuestions = 0

    init(presenter: TestPresenterLogic, test: Test) {
        self.presenter = presenter
        self.imagesFolderName = test.imagesFolderName
        self.uncompletedQuestions = Array(test.questions)
            .filter({ !$0.isCompleted })
            .shuffled()
        self.totalQuestions = test.questions.count
    }
    
    private func presentable(for question: Question) -> QuestionPresentable {
        return QuestionPresentable(
            id: question.id,
            text: question.text,
            image: imagesWorker.getImage(
                withName: question.imageName ?? "",
                fromFolder: imagesFolderName ?? ""),
            answers: presentables(for: shuffledAnswers),
            isMultipleChoice: isMultipleChoice(question))
    }
    
    private func presentables(for answers: [Answer]) -> [AnswerPresentable] {
        return answers.map({ answer in
            AnswerPresentable(
                text: answer.text,
                image: self.imagesWorker.getImage(
                    withName: answer.imageName ?? "",
                    fromFolder: self.imagesFolderName ?? ""))
        })
    }
    
    private func isMultipleChoice(_ question: Question) -> Bool {
        return question.answers.count(where: { $0.isCorrect }) > 1
    }
}

extension TestInteractor: TestInteractorLogic {
    func getNextQuestion() {
        let question = uncompletedQuestions[index]
        shuffledAnswers = Array(question.answers).shuffled()
        
        let testPresentable = TestPresentable(
            completedQuestions: completedQuestions,
            totalQuestions: totalQuestions,
            question: presentable(for: question))
        
        index += 1
        
        presenter.presentQuestion(testPresentable)
    }
}
