import UIKit

protocol TestsViewControllerLogic: AnyObject {
    func reloadCollectionView(with presentables: [TestsCollectionViewCellPresentable])
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
        interactor?.fetchTests()
    }
}

extension TestsViewController: TestsViewControllerLogic {
    func reloadCollectionView(with presentables: [TestsCollectionViewCellPresentable]) {
        dataSource.presentables = presentables
        testsView.collectionView.reloadData()
    }
    
}

extension TestsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            router?.showAddTestScreen()
        } else {
            
        }
    }
}
