import UIKit

protocol TestViewControllerLogic: AnyObject {

}

final class TestViewController: UIViewController {
    var interactor: TestInteractorLogic?
    var router: TestRouterProtocol?
    let dataSource = AnswersCollectionViewDataSource()
    
    private let testView = TestView()
    
    override func loadView() {
        self.view = testView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testView.answersCollectionView.delegate = self
        testView.answersCollectionView.dataSource = dataSource
    }
}

extension TestViewController: UICollectionViewDelegate {
    
}

extension TestViewController: TestViewControllerLogic {
    
}
