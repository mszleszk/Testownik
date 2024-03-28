import UIKit

protocol TestInteractorLogic {
    
}

final class TestInteractor {
    private let presenter: TestPresenterLogic
    private let databaseWorker = TestsDatabaseWorker()
    private var test: Test

    init(presenter: TestPresenterLogic, test: Test) {
        self.presenter = presenter
        self.test = test
        print(test)
    }
}

extension TestInteractor: TestInteractorLogic {
    
}
