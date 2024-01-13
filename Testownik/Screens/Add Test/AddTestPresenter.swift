import UIKit

protocol AddTestPresenterLogic {
    
}

final class AddTestPresenter {
    // MARK: - Private Properties
    private weak var viewController: AddTestViewControllerLogic?
    
    // MARK: - Initializers
    init(viewController: AddTestViewControllerLogic?) {
        self.viewController = viewController
    }
}

extension AddTestPresenter: AddTestPresenterLogic {
    
}
