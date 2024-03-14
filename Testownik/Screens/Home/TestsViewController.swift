import UIKit

protocol TestsViewControllerLogic: AnyObject {

}

final class TestsViewController: UIViewController {
    var interactor: TestsInteractorLogic?
    var router: TestsRouterProtocol?
    let dataSource = TestsCollectionViewDataSource()
    
    private let testsView = TestsView()
    
    override func loadView() {
        self.view = testsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testsView.collectionView.dataSource = dataSource
        testsView.collectionView.delegate = self
    }
    
    func addTest(_ test: Test) {
        dataSource.addTest(test)
        testsView.collectionView.reloadData()
    }
}

extension TestsViewController: TestsViewControllerLogic {
    
}

extension TestsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            router?.showAddTestScreen()
        } else {
            
        }
    }
}
