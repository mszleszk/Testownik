import UIKit
import RealmSwift

protocol AddTestInteractorLogic {
    func addFolder(withUrl url: URL)
    func addTest(name: String?, emoji: String?)
}

final class AddTestInteractor {
    private let presenter: AddTestPresenterLogic
    private var testFolderUrl: URL?
    
    init(presenter: AddTestPresenterLogic) {
        self.presenter = presenter
    }
}

extension AddTestInteractor: AddTestInteractorLogic {
    func addFolder(withUrl url: URL) {
        testFolderUrl = url
        presenter.presentAddedFolder(withUrl: url)
    }
    
    func addTest(name: String?, emoji: String?) {
        guard let name = name else { presenter.presentMissingNameError(); return }
        guard let emoji = emoji else { presenter.presentMissingEmojiError(); return }
        guard let folderUrl = testFolderUrl else { presenter.presentMissingFolderError(); return }
        
        do {
            let imagesFolderPath = try TestFilesWorker().saveImagesInAppFiles(from: folderUrl)
            
            let test = Test(name: name, emoji: emoji, questions: List<Question>(), imagesFolderPath: imagesFolderPath?.absoluteString)
            try TestsDatabaseWorker().saveTest(test)
            presenter.presentSuccess()
        } catch {
            presenter.presentGeneralError()
        }
    }
}
