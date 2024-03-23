import UIKit

protocol TestViewControllerLogic: AnyObject {

}

final class TestViewController: UIViewController {
    var interactor: TestInteractorLogic?
    var router: TestRouterProtocol?
    
    private let testView = TestView()
    
    override func loadView() {
        self.view = testView
    }
}

extension TestViewController: TestViewControllerLogic {
    
}
