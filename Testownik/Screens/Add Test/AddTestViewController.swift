import UIKit
import MCEmojiPicker

protocol AddTestViewControllerLogic: AnyObject {

}

final class AddTestViewController: UIViewController {
    var interactor: AddTestInteractorLogic?
    var router: AddTestRouterProtocol?
    
    private let addTestView = AddTestView()
    
    override func loadView() {
        self.view = addTestView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEmojiButton()
    }
    
    private func setupEmojiButton() {
        let action = UIAction { [weak self] action in
            let emojiController = MCEmojiPickerViewController()
            emojiController.delegate = self
            emojiController.sourceView = action.sender as? UIButton
            self?.present(emojiController, animated: true)
        }
        addTestView.addEmojiButton.addAction(action, for: .touchUpInside)
    }
}

extension AddTestViewController: AddTestViewControllerLogic {
    
}

extension AddTestViewController: MCEmojiPickerDelegate {
    func didGetEmoji(emoji: String) {
        addTestView.setEmoji(emoji)
    }
}
