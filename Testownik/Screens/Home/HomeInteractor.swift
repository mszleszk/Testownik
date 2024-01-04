import UIKit

protocol HomeInteractorLogic {
    func getDataSource() -> TestsCollectionViewDataSource
}

final class HomeInteractor {
    private let presenter: HomePresenterLogic
    private let dataSource: TestsCollectionViewDataSource
    
    init(presenter: HomePresenterLogic, dataSource: TestsCollectionViewDataSource) {
        self.presenter = presenter
        self.dataSource = dataSource
    }
}

extension HomeInteractor: HomeInteractorLogic {
    func getDataSource() -> TestsCollectionViewDataSource {
        return dataSource
    }
}
