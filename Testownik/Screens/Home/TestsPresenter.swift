import UIKit

protocol TestsPresenterLogic {
    
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
    
}
