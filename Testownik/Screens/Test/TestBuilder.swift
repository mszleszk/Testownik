import UIKit

protocol TestBuilderProtocol {
    func build(testId: String) -> UIViewController
}

class TestBuilder: TestBuilderProtocol {
    func build(testId: String) -> UIViewController {
        let viewController = TestViewController()
        
        let presenter = TestPresenter(viewController: viewController)
        let interactor = TestInteractor(presenter: presenter, testId: testId)
        let router = TestRouter(viewController: viewController)

        viewController.interactor = interactor
        viewController.router = router

        return viewController
    }
}
