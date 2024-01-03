import UIKit

protocol HomeRouterProtocol {
    
}

final class HomeRouter {
    // MARK: - Public Properties
    weak var viewController: HomeViewController?

    // MARK: - Initializers
    init(viewController: HomeViewController?) {
        self.viewController = viewController
    }
}

extension HomeRouter: HomeRouterProtocol {
   
}
