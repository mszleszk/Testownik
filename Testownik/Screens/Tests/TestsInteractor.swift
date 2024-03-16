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
        do{
            guard let tests = tests else { return }
            try databaseWorker.deleteTest(test: tests[index])
        } catch {
            presenter.presentGeneralError()
        }
        
        fetchTests()
    }
}
