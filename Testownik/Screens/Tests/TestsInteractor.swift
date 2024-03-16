import UIKit
import RealmSwift

protocol TestsInteractorLogic {
    func fetchTests()
    func deleteTest(at index: Int)
}

final class TestsInteractor {
    private let presenter: TestsPresenterLogic
    private var tests: Results<Test>?
    private let databaseWorker = TestsDatabaseWorker()
    private let filesWorker = TestFilesWorker()
    
    init(presenter: TestsPresenterLogic) {
        self.presenter = presenter
    }
}

extension TestsInteractor: TestsInteractorLogic {
    func fetchTests() {
        let results = databaseWorker.getTests()
        tests = results
        presenter.presentCollectionView(with: Array(results))
    }
    
    func deleteTest(at index: Int) {
        guard let tests = tests else { return }
        
        do{
            let test = tests[index]
            
            if let imagesFolderName = test.imagesFolderName {
                try filesWorker.removeFolder(withName: imagesFolderName)
            }
            
            try databaseWorker.deleteTest(test: test)
            
            presenter.presentCollectionViewDeletion(atIndex: index)
        } catch {
            presenter.presentGeneralError()
        }
    }
}
