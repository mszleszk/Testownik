import UIKit
import RealmSwift

protocol TestsInteractorLogic {
    func fetchTests()
    func deleteTest(at index: Int)
    func chooseTest(at index: Int)
}

final class TestsInteractor {
    private let presenter: TestsPresenterLogic
    private var tests = TestsResults()
    private let databaseWorker = DatabaseWorker()
    private let filesWorker = ImageFilesWorker()
    
    init(presenter: TestsPresenterLogic) {
        self.presenter = presenter
    }
}

extension TestsInteractor: TestsInteractorLogic {
    func fetchTests() {
        let results = databaseWorker.getTests()
        tests.set(results)
        presenter.presentCollectionView(with: Array(results))
    }
    
    func deleteTest(at index: Int) {
        guard let test = tests[index] else {
            presenter.presentGeneralError()
            return
        }
        
        do{
            if let imagesFolderName = test.imagesFolderName {
                try filesWorker.removeFolder(withName: imagesFolderName)
            }
            
            try databaseWorker.deleteTest(test: test)
            
            presenter.presentCollectionViewDeletion(atIndex: index)
        } catch {
            presenter.presentGeneralError()
        }
    }
    
    func chooseTest(at index: Int) {
        guard let test = tests[index] else {
            presenter.presentGeneralError()
            return
        }
        
        presenter.presentTest(test)
    }
}
