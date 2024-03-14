import UIKit

protocol HomeInteractorLogic {
    
}

final class TestsInteractor {
    private let presenter: HomePresenterLogic
    
    init(presenter: HomePresenterLogic) {
        self.presenter = presenter
    }
}

extension TestsInteractor: HomeInteractorLogic {
    
}
