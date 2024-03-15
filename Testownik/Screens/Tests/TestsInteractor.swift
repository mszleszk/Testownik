import UIKit
import RealmSwift

protocol TestsInteractorLogic {
    func fetchTests()
}

final class TestsInteractor {
    private let presenter: TestsPresenterLogic
    private var tests: Results<Test>?
    
    init(presenter: TestsPresenterLogic) {
        self.presenter = presenter
    }
}

extension TestsInteractor: TestsInteractorLogic {
    func fetchTests() {
        let results = TestsDatabaseWorker().getTests()
        tests = results
        presenter.presentCollectionView(with: Array(results))
    }
}
