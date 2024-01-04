import UIKit

protocol HomeInteractorLogic {
    func getDataSource() -> CoursesCollectionViewDataSource
}

final class HomeInteractor {
    private let presenter: HomePresenterLogic
    private let dataSource: CoursesCollectionViewDataSource
    
    init(presenter: HomePresenterLogic, dataSource: CoursesCollectionViewDataSource) {
        self.presenter = presenter
        self.dataSource = dataSource
    }
}

extension HomeInteractor: HomeInteractorLogic {
    func getDataSource() -> CoursesCollectionViewDataSource {
        return dataSource
    }
}
