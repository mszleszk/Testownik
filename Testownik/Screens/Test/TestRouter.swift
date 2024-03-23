import UIKit

protocol TestRouterProtocol {
    
}

final class TestRouter {
    // MARK: - Public Properties
    weak var viewController: TestViewController?

    // MARK: - Initializers
    init(viewController: TestViewController?) {
        self.viewController = viewController
    }
}

extension TestRouter: TestRouterProtocol {
   
}
