import UIKit

protocol TestInteractorLogic {
    func fetchTest(withId id: String)
}

final class TestInteractor {
    private let presenter: TestPresenterLogic
    private let databaseWorker = TestsDatabaseWorker()
    private var test: Test?

    init(presenter: TestPresenterLogic, testId: String) {
        self.presenter = presenter
        fetchTest(withId: testId)
    }
}

extension TestInteractor: TestInteractorLogic {
    func fetchTest(withId id: String) {
        guard let test = databaseWorker.getTest(withId: id) else {
            presenter.presentCantFetchTestError()
            return
        }
        
        self.test = test
    }
}
