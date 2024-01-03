import UIKit

protocol HomeViewControllerLogic: AnyObject {

}

final class HomeViewController: UIViewController {
    // MARK: - Public Properties
    var interactor: HomeInteractorLogic?
    var router: HomeRouterProtocol?
}

extension HomeViewController: HomeViewControllerLogic {
    
}
