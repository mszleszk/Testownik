import UIKit

protocol AddTestBuilderProtocol {
    func build() -> UIViewController
}

class AddTestBuilder: AddTestBuilderProtocol {
    func build() -> UIViewController {
        let viewController = AddTestViewController()
        
        let presenter = AddTestPresenter(viewController: viewController)
        let interactor = AddTestInteractor(presenter: presenter)
        let router = AddTestRouter(viewController: viewController)

        viewController.interactor = interactor
        viewController.router = router
        
        router.dataStore = interactor

        return viewController
    }
}
