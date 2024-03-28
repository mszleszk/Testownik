import UIKit

protocol TestBuilderProtocol {
    func build(test: Test) -> UIViewController
}

class TestBuilder: TestBuilderProtocol {
    func build(test: Test) -> UIViewController {
        let viewController = TestViewController()
        
        let presenter = TestPresenter(viewController: viewController)
        let interactor = TestInteractor(presenter: presenter, test: test)
        let router = TestRouter(viewController: viewController)

        viewController.interactor = interactor
        viewController.router = router

        return viewController
    }
}
