import UIKit

protocol AddTestPresenterLogic {
    func presentAddedFolder(withUrl url: URL)
    func presentMissingNameError()
    func presentMissingEmojiError()
    func presentMissingFolderError()
    func presentGeneralError()
    func presentSuccess()
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
    func presentSuccess() {
        viewController?.success()
    }
    
    func presentAddedFolder(withUrl url: URL) {
        viewController?.showAddedFolder(withName: url.lastPathComponent)
    }
    
    func presentMissingNameError() {
        viewController?.showError(withMessage: L10n.AddTest.Error.noName)
    }
    
    func presentMissingEmojiError() {
        viewController?.showError(withMessage: L10n.AddTest.Error.noEmoji)
    }
    
    func presentMissingFolderError() {
        viewController?.showError(withMessage: L10n.AddTest.Error.noFolder)
    }
    
    func presentGeneralError() {
        viewController?.showError(withMessage: nil)
    }
}
