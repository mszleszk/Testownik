import UIKit

protocol TestPresenterLogic {
    
}

final class TestPresenter {
    // MARK: - Private Properties
    private weak var viewController: TestViewControllerLogic?
    
    // MARK: - Initializers
    init(viewController: TestViewControllerLogic?) {
        self.viewController = viewController
    }
}

extension TestPresenter: TestPresenterLogic {
    
}
