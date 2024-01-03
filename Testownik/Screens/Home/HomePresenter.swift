import UIKit

protocol HomePresenterLogic {
    
}

final class HomePresenter {
    // MARK: - Private Properties
    private weak var viewController: HomeViewControllerLogic?
    
    // MARK: - Initializers
    init(viewController: HomeViewControllerLogic?) {
        self.viewController = viewController
    }
}

extension HomePresenter: HomePresenterLogic {
    
}
