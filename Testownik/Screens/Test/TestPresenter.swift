import UIKit

protocol TestPresenterLogic {
    func presentCantFetchTestError()
}

final class TestPresenter {
    private weak var viewController: TestViewControllerLogic?
    
    init(viewController: TestViewControllerLogic?) {
        self.viewController = viewController
    }
}

extension TestPresenter: TestPresenterLogic {
    func presentCantFetchTestError() {
        viewController?.showError(withMessage: L10n.Test.Error.cantFetchTest)
    }
}
