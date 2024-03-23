import UIKit

protocol TestBuilderProtocol {
    func build() -> UIViewController
}

class TestBuilder: TestBuilderProtocol {
    func build() -> UIViewController {
        let viewController = TestViewController()
        
        let presenter = TestPresenter(viewController: viewController)
        let interactor = TestInteractor(presenter: presenter)
        let router = TestRouter(viewController: viewController)

        viewController.interactor = interactor
        viewController.router = router

        return viewController
    }
}
