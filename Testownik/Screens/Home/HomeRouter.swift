import UIKit

protocol HomeRouterProtocol {
    func showAddTestScreen()
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
    func showAddTestScreen() {
        viewController?.show(AddTestBuilder().build(), sender: viewController)
    }
}
