import UIKit

protocol TestsInteractorLogic {
    
}

final class TestsInteractor {
    private let presenter: TestsPresenterLogic
    
    init(presenter: TestsPresenterLogic) {
        self.presenter = presenter
    }
}

extension TestsInteractor: TestsInteractorLogic {
    
}
