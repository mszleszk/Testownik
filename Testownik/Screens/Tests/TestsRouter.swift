import UIKit

protocol TestsRouterProtocol {
    func showAddTestScreen()
}

final class TestsRouter {
    // MARK: - Public Properties
    weak var viewController: TestsViewController?

    // MARK: - Initializers
    init(viewController: TestsViewController?) {
        self.viewController = viewController
    }
}

extension TestsRouter: TestsRouterProtocol {
    func showAddTestScreen() {
        viewController?.show(AddTestBuilder().build(), sender: viewController)
    }
}
