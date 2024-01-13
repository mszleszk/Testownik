import UIKit

protocol AddTestInteractorLogic {
    func addFolderUrl(_ url: URL)
}

final class AddTestInteractor {
    private let presenter: AddTestPresenterLogic
    private var folderUrl: URL?
    
    init(presenter: AddTestPresenterLogic) {
        self.presenter = presenter
    }
}

extension AddTestInteractor: AddTestInteractorLogic {
    func addFolderUrl(_ url: URL) {
        folderUrl = url
        presenter.presentAddedFolder(withUrl: url)
    }
}
