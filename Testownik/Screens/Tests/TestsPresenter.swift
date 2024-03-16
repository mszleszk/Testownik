import UIKit

protocol TestsPresenterLogic {
    func presentCollectionView(with tests: [Test])
    func presentGeneralError()
}

final class TestsPresenter {
    // MARK: - Private Properties
    private weak var viewController: TestsViewControllerLogic?
    
    // MARK: - Initializers
    init(viewController: TestsViewControllerLogic?) {
        self.viewController = viewController
    }
}

extension TestsPresenter: TestsPresenterLogic {
    func presentCollectionView(with tests: [Test]) {
        viewController?.reloadCollectionView(with: tests.map({ test in
            TestsCollectionViewCellPresentable(
                name: test.name,
                emoji: test.emoji,
                numberOfQuestions: test.questions.count)
        }))
    }
    
    func presentGeneralError() {
        viewController?.showError(withMessage: nil)
    }
}
