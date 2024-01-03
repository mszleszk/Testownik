import UIKit

protocol HomeBuilderProtocol {
    func build() -> UIViewController
}

class HomeBuilder: HomeBuilderProtocol {
    func build() -> UIViewController {
        let viewController = HomeViewController()
        
        let presenter = HomePresenter(viewController: viewController)
        let interactor = HomeInteractor(presenter: presenter)
        let router = HomeRouter(viewController: viewController)

        viewController.interactor = interactor
        viewController.router = router

        return viewController
    }
}