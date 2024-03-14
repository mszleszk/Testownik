import UIKit

protocol HomeBuilderProtocol {
    func build() -> UIViewController
}

class TestsBuilder: HomeBuilderProtocol {
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
