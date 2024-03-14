import UIKit

protocol AddTestInteractorLogic {
    func addFolder(withUrl url: URL)
    func addTest(name: String?, emoji: String?)
}

protocol AddTestDataStore {
    var testToAdd: Test? { get }
}

final class AddTestInteractor: AddTestDataStore {
    var testToAdd: Test?
    
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
        
//        do {
//            let imagesFolderUrl = try TestFilesWorker().saveImagesInAppFiles(from: folderUrl)
            
            testToAdd = Test(name: name, emoji: emoji, questions: [], imagesFolderUrl: nil)
            presenter.presentSuccess()
//        } catch {
//            presenter.presentGeneralError()
//        }
    }
}
