import UIKit

protocol TestPresenterLogic {
    func presentCantFetchTestError()
    func presentTest(_ testPresentable: TestPresentable)
    func presentCheckedAnswers(_ answersPresentables: [AnswerPresentable])
}

final class TestPresenter {
    private weak var viewController: TestViewControllerLogic?
    
    init(viewController: TestViewControllerLogic?) {
        self.viewController = viewController
    }
}

extension TestPresenter: TestPresenterLogic {
    func presentCheckedAnswers(_ answersPresentables: [AnswerPresentable]) {
        viewController?.updateAnswers(with: answersPresentables)
    }
    
    func presentTest(_ testPresentable: TestPresentable) {
        viewController?.updateTest(with: testPresentable)
    }
    
    func presentCantFetchTestError() {
        viewController?.showError(withMessage: L10n.Test.Error.cantFetchTest)
    }
}
