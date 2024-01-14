import UIKit

protocol AddTestInteractorLogic {
    func addFolder(withUrl url: URL)
    func addTest(name: String?, emoji: String?)
}

final class AddTestInteractor {
    private let presenter: AddTestPresenterLogic
    private var folderUrl: URL?
    
    init(presenter: AddTestPresenterLogic) {
        self.presenter = presenter
    }
}

extension AddTestInteractor: AddTestInteractorLogic {
    func addFolder(withUrl url: URL) {
        folderUrl = url
        presenter.presentAddedFolder(withUrl: url)
    }
    
    func addTest(name: String?, emoji: String?) {
        guard let name = name else { presenter.presentMissingNameError(); return }
        guard let emoji = emoji else { presenter.presentMissingEmojiError(); return }
        guard let folderUrl = folderUrl else { presenter.presentMissingFolderError(); return }
        
        do {
            try TestFilesWorker().saveImagesInAppFiles(from: folderUrl)
        } catch {
            print(error)
            presenter.presentGeneralError()
        }
    }
}
