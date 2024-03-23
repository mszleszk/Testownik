import UIKit

protocol TestViewControllerLogic: AnyObject {

}

final class TestViewController: UIViewController {
    // MARK: - Public Properties
    var interactor: TestInteractorLogic?
    var router: TestRouterProtocol?
}

extension TestViewController: TestViewControllerLogic {
    
}
