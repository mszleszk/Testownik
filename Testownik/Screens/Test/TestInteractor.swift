import UIKit
import RealmSwift

protocol TestInteractorLogic {
    func getNextQuestion()
    func checkAnswers(selectedIndices: [IndexPath]?)
}

final class TestInteractor {
    private let presenter: TestPresenterLogic
    private let imagesWorker = ImageFilesWorker()
    private let databaseWorker = DatabaseWorker()
    private let test: Test
    private var currentQuestion: Question?
    private var shuffledAnswers = Array<Answer>()

    init(presenter: TestPresenterLogic, test: Test) {
        self.presenter = presenter
        self.test = test
    }
    
    private func isMultipleChoice(_ question: Question) -> Bool {
        return question.answers.count(where: { $0.isCorrect }) > 1
    }
    
    private func getAnswersPresentables(
        shouldConsiderState: Bool, 
        selectedIndices: [IndexPath]? = nil) -> [AnswerPresentable] {
        return shuffledAnswers.enumerated().map { index, answer in
            let answerState: AnswerState
            
            if shouldConsiderState {
                if answer.isCorrect {
                    answerState = .correct
                } else if let selectedIndices = selectedIndices,
                            selectedIndices.contains(where: { $0.item == index }),
                            !answer.isCorrect {
                    answerState = .incorrect
                } else {
                    answerState = .normal
                }
            } else {
                answerState = .normal
            }
            
            return AnswerPresentable(
                text: answer.text,
                image: self.imagesWorker.getImage(
                    withName: answer.imageName ?? "",
                    fromFolder: test.imagesFolderName ?? ""),
                state: answerState)
        }
    }
    
    private func getQuestionPresentable(_ question: Question) -> QuestionPresentable {
        return QuestionPresentable(
            text: question.text,
            image: imagesWorker.getImage(
                withName: question.imageName ?? "",
                fromFolder: test.imagesFolderName ?? ""),
            answers: getAnswersPresentables(shouldConsiderState: false),
            isMultipleChoice: isMultipleChoice(question))
    }
    
    private func isUserAnswerCorrect(selectedIndices: [IndexPath]?) -> Bool {
        guard let selectedIndices = selectedIndices else { return false }
        
        var isCorrect = true
        
        shuffledAnswers.enumerated().forEach { index, answer in
            if (selectedIndices.contains(where: { $0.item == index }) || selectedIndices.isEmpty), !answer.isCorrect {
                isCorrect = false
            }
        }
        
        return isCorrect
    }
}

extension TestInteractor: TestInteractorLogic {
    func checkAnswers(selectedIndices: [IndexPath]?) {
        if isUserAnswerCorrect(selectedIndices: selectedIndices) {
            if let currentQuestion = currentQuestion {
                do {
                    try databaseWorker.setQuestionCompleted(currentQuestion)
                } catch {
                    presenter.presentGeneralError()
                }
            }
        }
        
        let answersPresentables = getAnswersPresentables(shouldConsiderState: true, selectedIndices: selectedIndices)
        presenter.presentCheckedAnswers(answersPresentables)
    }
    
    func getNextQuestion() {
        let uncompletedQuestions = test.questions.where({ !$0.isCompleted })
        
        guard let question = uncompletedQuestions.randomElement() else {
            
            return
        }
        
        currentQuestion = question
        shuffledAnswers = Array(question.answers).shuffled()
        
        let testPresentable = TestPresentable(
            completedQuestionsCount: test.questions.count - uncompletedQuestions.count,
            totalQuestionsCount: test.questions.count,
            question: getQuestionPresentable(question))
        
        presenter.presentTest(testPresentable)
    }
}
