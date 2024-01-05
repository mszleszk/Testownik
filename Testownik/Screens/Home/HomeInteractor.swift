import UIKit

protocol HomeInteractorLogic {
    
}

final class HomeInteractor {
    private let presenter: HomePresenterLogic
    
    init(presenter: HomePresenterLogic) {
        self.presenter = presenter
    }
}

extension HomeInteractor: HomeInteractorLogic {
    
}
