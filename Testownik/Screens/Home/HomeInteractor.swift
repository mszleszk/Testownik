import UIKit

protocol HomeInteractorLogic {
    
}

final class HomeInteractor {
    // MARK: - Private Properties
    private let presenter: HomePresenterLogic

    // MARK: - Initializers
    init(presenter: HomePresenterLogic) {
        self.presenter = presenter
    }
}

extension HomeInteractor: HomeInteractorLogic {
    
}
