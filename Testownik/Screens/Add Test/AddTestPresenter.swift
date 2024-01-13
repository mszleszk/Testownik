import UIKit

protocol AddTestPresenterLogic {
    func presentAddedFolder(withUrl url: URL)
}

final class AddTestPresenter {
    // MARK: - Private Properties
    private weak var viewController: AddTestViewControllerLogic?
    
    // MARK: - Initializers
    init(viewController: AddTestViewControllerLogic?) {
        self.viewController = viewController
    }
}

extension AddTestPresenter: AddTestPresenterLogic {
    func presentAddedFolder(withUrl url: URL) {
        viewController?.showAddedFolder(withName: url.lastPathComponent)
    }
}
