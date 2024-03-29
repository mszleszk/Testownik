import UIKit

protocol TestPresenterLogic {
    func presentCantFetchTestError()
    func presentQuestion(_ questionPresentable: TestPresentable)
}

final class TestPresenter {
    private weak var viewController: TestViewControllerLogic?
    
    init(viewController: TestViewControllerLogic?) {
        self.viewController = viewController
    }
}

extension TestPresenter: TestPresenterLogic {
    func presentQuestion(_ questionPresentable: TestPresentable) {
        viewController?.updateView(with: questionPresentable)
    }
    
    func presentCantFetchTestError() {
        viewController?.showError(withMessage: L10n.Test.Error.cantFetchTest)
    }
}
