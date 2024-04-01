import UIKit
import RealmSwift

protocol TestInteractorLogic {
    func getNextQuestion()
    func checkAnswers(selectedIndices: [IndexPath]?)
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
    
    private func isMultipleChoice(_ question: Question) -> Bool {
        return question.answers.count(where: { $0.isCorrect }) > 1
    }
}

extension TestInteractor: TestInteractorLogic {
    func checkAnswers(selectedIndices: [IndexPath]?) {
        let answersPresentables = shuffledAnswers.enumerated().map { index, answer in
            let answerState: AnswerState
            
            if answer.isCorrect {
                answerState = .correct
            } else if let selectedIndices = selectedIndices,
                        selectedIndices.contains(where: { $0.item == index }) && !answer.isCorrect {
                answerState = .incorrect
            } else {
                answerState = .normal
            }
            
            return AnswerPresentable(
                text: answer.text,
                image: self.imagesWorker.getImage(
                    withName: answer.imageName ?? "",
                    fromFolder: self.imagesFolderName ?? ""),
                state: answerState)
        }
        
        presenter.presentCheckedAnswers(answersPresentables)
    }
    
    func getNextQuestion() {
        let question = uncompletedQuestions[index]
        shuffledAnswers = Array(question.answers).shuffled()
        
        let answersPresentables = shuffledAnswers.map({ answer in
            AnswerPresentable(
                text: answer.text,
                image: self.imagesWorker.getImage(
                    withName: answer.imageName ?? "",
                    fromFolder: self.imagesFolderName ?? ""),
                state: .normal)
        })
        
        let questionPresentable = QuestionPresentable(
            id: question.id,
            text: question.text,
            image: imagesWorker.getImage(
                withName: question.imageName ?? "",
                fromFolder: imagesFolderName ?? ""),
            answers: answersPresentables,
            isMultipleChoice: isMultipleChoice(question))
        
        let testPresentable = TestPresentable(
            completedQuestions: completedQuestions,
            totalQuestions: totalQuestions,
            question: questionPresentable)
        
        index += 1
        
        presenter.presentTest(testPresentable)
    }
}
