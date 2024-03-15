import UIKit

protocol TestsBuilderProtocol {
    func build() -> UIViewController
}

class TestsBuilder: TestsBuilderProtocol {
    func build() -> UIViewController {
        let viewController = TestsViewController()
        
        let presenter = TestsPresenter(viewController: viewController)
        let interactor = TestsInteractor(presenter: presenter)
        let router = TestsRouter(viewController: viewController)

        viewController.interactor = interactor
        viewController.router = router

        return viewController
    }
}
