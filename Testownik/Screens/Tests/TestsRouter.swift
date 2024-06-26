import UIKit

protocol TestsRouterProtocol {
    func showAddTestScreen()
    func showTest(_ test: Test)
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
    
    func showTest(_ test: Test) {
        let testViewController = TestBuilder().build(test: test)
        testViewController.modalPresentationStyle = .fullScreen
        viewController?.show(testViewController, sender: viewController)
    }
}
