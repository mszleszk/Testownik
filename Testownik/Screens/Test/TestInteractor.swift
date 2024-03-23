import UIKit

protocol TestInteractorLogic {
    
}

final class TestInteractor {
    // MARK: - Private Properties
    private let presenter: TestPresenterLogic

    // MARK: - Initializers
    init(presenter: TestPresenterLogic) {
        self.presenter = presenter
    }
}

extension TestInteractor: TestInteractorLogic {
    
}
