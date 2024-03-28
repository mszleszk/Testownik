import UIKit

protocol TestsRouterProtocol {
    func showAddTestScreen()
    func showTest(withId id: String)
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
    
    func showTest(withId id: String) {
        viewController?.show(TestBuilder().build(testId: id), sender: viewController)
    }
}
