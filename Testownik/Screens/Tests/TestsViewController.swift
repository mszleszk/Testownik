import UIKit

protocol TestsViewControllerLogic: AnyObject, ErrorPresenting {
    func reloadCollectionView(with presentables: [TestsCollectionViewCellPresentable])
    func deleteCollectionViewCell(atIndex index: Int)
    func showTest(_ test: Test)
}

final class TestsViewController: UIViewController {
    var interactor: TestsInteractorLogic?
    var router: TestsRouterProtocol?
    
    private let dataSource = TestsCollectionViewDataSource()
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
    func showTest(_ test: Test) {
        router?.showTest(test)
    }
    
    func deleteCollectionViewCell(atIndex index: Int) {
        dataSource.presentables.remove(at: index)
        testsView.collectionView.deleteItems(at: [IndexPath(row: index, section: 0)])
    }
    
    func reloadCollectionView(with presentables: [TestsCollectionViewCellPresentable]) {
        dataSource.presentables.set(presentables)
        testsView.collectionView.reloadData()
    }
    
}

extension TestsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            router?.showAddTestScreen()
        } else {
            interactor?.chooseTest(at: indexPath.item)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemsAt indexPaths: [IndexPath], point: CGPoint) -> UIContextMenuConfiguration? {
        guard let index = indexPaths.first?.row, index != 0 && !indexPaths.isEmpty else { return nil }
        
        return UIContextMenuConfiguration(actionProvider:  { [weak self] _ in
            let deleteAction = UIAction(
                title: L10n.General.delete,
                image: UIImage(systemName: "trash"),
                attributes: .destructive) { _ in
                    guard let index = indexPaths.first?.row else { return }
                    self?.interactor?.deleteTest(at: index)
                }
            return UIMenu(children: [deleteAction])
        })
    }
}
