import UIKit

protocol AddTestRouterProtocol {
    
}

final class AddTestRouter {
    // MARK: - Public Properties
    weak var viewController: AddTestViewController?

    // MARK: - Initializers
    init(viewController: AddTestViewController?) {
        self.viewController = viewController
    }
}

extension AddTestRouter: AddTestRouterProtocol {
   
}
