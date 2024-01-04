import UIKit

protocol HomeViewControllerLogic: AnyObject {

}

final class HomeViewController: UIViewController {
    var interactor: HomeInteractorLogic?
    var router: HomeRouterProtocol?
    
    private let homeView = HomeView()
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        homeView.collectionView.dataSource = interactor?.getDataSource()
        homeView.collectionView.delegate = interactor?.getDataSource()
    }
}

extension HomeViewController: HomeViewControllerLogic {
    
}
