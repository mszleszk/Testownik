import UIKit

protocol HomeViewControllerLogic: AnyObject {

}

final class HomeViewController: UIViewController {
    var interactor: HomeInteractorLogic?
    var router: HomeRouterProtocol?
    
    private let homeView = HomeView()
    private let dataSource = TestsCollectionViewDataSource()
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        homeView.collectionView.dataSource = dataSource
        homeView.collectionView.delegate = self
    }
}

extension HomeViewController: HomeViewControllerLogic {
    
}

extension HomeViewController: UICollectionViewDelegate {
    
}
