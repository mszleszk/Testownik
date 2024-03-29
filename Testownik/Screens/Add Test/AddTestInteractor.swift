import UIKit
import RealmSwift

protocol AddTestInteractorLogic {
    func addFolder(withUrl url: URL)
    func addTest(name: String?, emoji: String?)
}

final class AddTestInteractor {
    private let presenter: AddTestPresenterLogic
    private var testFolderUrl: URL?
    private let imagesWorker = ImageFilesWorker()
    private let questionsWorker = QuestionFilesWorker()
    
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
            let imagesFolderName = try imagesWorker.saveImagesInAppFiles(from: folderUrl)
            let questions = try questionsWorker.fetchQuestions(from: folderUrl)
            let test = Test(
                name: name,
                emoji: emoji,
                questions: questions,
                imagesFolderName: imagesFolderName)
            try DatabaseWorker().saveTest(test)
            presenter.presentSuccess()
        } catch {
            presenter.presentGeneralError()
        }
    }
}
