import UIKit

protocol AddTestInteractorLogic {
    
}

final class AddTestInteractor {
    // MARK: - Private Properties
    private let presenter: AddTestPresenterLogic

    // MARK: - Initializers
    init(presenter: AddTestPresenterLogic) {
        self.presenter = presenter
    }
}

extension AddTestInteractor: AddTestInteractorLogic {
    
}
