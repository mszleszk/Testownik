import UIKit

protocol HomeViewControllerLogic: AnyObject {

}

final class TestsViewController: UIViewController {
    var interactor: HomeInteractorLogic?
    var router: HomeRouterProtocol?
    let dataSource = TestsCollectionViewDataSource()
    
    private let homeView = TestsView()
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.collectionView.dataSource = dataSource
        homeView.collectionView.delegate = self
    }
    
    func addTest(_ test: Test) {
        dataSource.addTest(test)
        homeView.collectionView.reloadData()
    }
}

extension TestsViewController: HomeViewControllerLogic {
    
}

extension TestsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            router?.showAddTestScreen()
        } else {
            
        }
    }
}
