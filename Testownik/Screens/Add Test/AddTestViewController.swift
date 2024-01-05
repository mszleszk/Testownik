import UIKit

protocol AddTestViewControllerLogic: AnyObject {

}

final class AddTestViewController: UIViewController {
    var interactor: AddTestInteractorLogic?
    var router: AddTestRouterProtocol?
    
    private let addTestView = AddTestView()
    
    override func loadView() {
        self.view = addTestView
    }
}

extension AddTestViewController: AddTestViewControllerLogic {
    
}
