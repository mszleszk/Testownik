import UIKit

protocol HomePresenterLogic {
    
}

final class TestsPresenter {
    // MARK: - Private Properties
    private weak var viewController: HomeViewControllerLogic?
    
    // MARK: - Initializers
    init(viewController: HomeViewControllerLogic?) {
        self.viewController = viewController
    }
}

extension TestsPresenter: HomePresenterLogic {
    
}
